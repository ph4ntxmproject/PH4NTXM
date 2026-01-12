#!/usr/bin/env bash
set -euo pipefail
safe() { "$@" >/dev/null 2>&1 || true; }

generate_hostname() {
  SKULIST_FILE="/etc/ph4ntxm-skulist"
  NAMELIST_FILE="/etc/ph4ntxm-namelist"

  declare -A families_map=(
    [lenovo]="thinkpad ideapad legion yoga"
    [dell]="inspiron xps latitude precision optiplex"
    [hp]="elitebook pavilion omen probook zbook"
    [asus]="zenbook vivobook rog tuf expertbook"
    [acer]="swift aspire predator chromebook"
    [samsung]="galaxybook"
    [apple]="macbook imac macmini"
    [microsoft]="surface"
    [msi]="prestige stealth titan gf"
    [razer]="blade"
    [lg]="gram"
    [sony]="vaio"
    [google]="pixelbook"
    [intel]="nuc"
    [ibm]="thinkcentre"
    [lenovopc]="thinkcentre"
    [origin]="chronos"
    [hpdesk]="prodesk"
    [toshiba]="satellite portage"
    [fujitsu]="lifebook esprimo"
  )

  vendors=(lenovo dell hp asus acer samsung apple microsoft msi razer lg sony google intel ibm lenovopc origin hpdesk toshiba fujitsu)
  misc=(home router office media nas cam printer)
  windows_pref=("DESKTOP-" "LAPTOP-")
  router_pref=(router gateway modem)

  rnd() { tr -dc 'a-z0-9' </dev/urandom | head -c"${1:-4}" || printf 'x'; }

  r=$((RANDOM % 100))

  if [ $r -lt 45 ]; then
    V="${vendors[$((RANDOM % ${#vendors[@]}))]}"
    Flist="${families_map[$V]}"
    set -- $Flist
    cnt=$#
    idx=$((RANDOM % cnt + 1))
    F="$(printf "%s" "$Flist" | cut -d' ' -f "$idx")"
    SUF="$(rnd $((3 + RANDOM % 3)))"
    SEPS=('-' '_' '')
    SEP="${SEPS[$((RANDOM % ${#SEPS[@]}))]}"
    HOST="${V}${SEP}${F}${SEP}${SUF}"

  elif [ $r -lt 60 ]; then
    if [ -r "$SKULIST_FILE" ]; then
      SKU="$(shuf -n1 "$SKULIST_FILE" 2>/dev/null || true)"
      if [ -n "${SKU:-}" ]; then
        HOST="$(printf "%s" "$SKU" | tr -cd '[:alnum:]-' | tr '[:upper:]' '[:lower:]')"
      fi
    fi
    [ -z "${HOST:-}" ] && HOST="sku-$(rnd 6)"

  elif [ $r -lt 75 ]; then
    if [ -r "$NAMELIST_FILE" ]; then
      H="$(shuf -n1 "$NAMELIST_FILE" || true)"
      if [ -n "$H" ]; then
        HOST="$(printf "%s" "$H" | tr '[:upper:]' '[:lower:]')-$(rnd 3)"
      fi
    fi
    [ -z "${HOST:-}" ] && HOST="name-$(rnd 6)"

  elif [ $r -lt 90 ]; then
    P="${windows_pref[$((RANDOM % ${#windows_pref[@]}))]}"
    N="$(tr -dc 'A-Z0-9' </dev/urandom | head -c6)"
    HOST="$(printf "%s%s" "$P" "$N" | tr '[:upper:]' '[:lower:]')"

  else
    if [ $((RANDOM%2)) -eq 0 ]; then
      RP="${router_pref[$((RANDOM % ${#router_pref[@]}))]}"
      HOST="${RP}-$(rnd 5)"
    else
      M="${misc[$((RANDOM % ${#misc[@]}))]}"
      HOST="${M}-$(rnd 5)"
    fi
  fi

  if [ $((RANDOM % 40)) -eq 0 ]; then
    HOST="${HOST}-$(printf '%02d' $((20 + RANDOM % 6)))"
  fi

  HOST="$(printf "%s" "$HOST" | sed 's/[^a-z0-9_-]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')"
  HOST="$(printf "%s" "$HOST" | tr '[:upper:]' '[:lower:]')"
  printf '%s' "${HOST:0:32}"
}

for p in /var/lib/dhcp/* /var/lib/NetworkManager/* /var/lib/connman/* /var/lib/avahi/* /run/NetworkManager/*; do
  [ -e "$p" ] && safe rm -rf "$p"
done

if command -v macchanger >/dev/null 2>&1; then
  for devpath in /sys/class/net/*; do
    iface=$(basename "$devpath")
    [ "$iface" = "lo" ] && continue
    [ -e "/sys/class/net/$iface/address" ] || continue
    for i in 1 2 3; do
      safe ip link set "$iface" down
      safe /usr/bin/macchanger -r "$iface"
      safe ip link set "$iface" up
      newmac=$(ip -o link show dev "$iface" 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="link/ether"){print $(i+1); break}}' || true)
      [ -n "$newmac" ] && break
      sleep 0.2
    done
  done
fi

safe rm -f /etc/machine-id /var/lib/dbus/machine-id
if command -v systemd-machine-id-setup >/dev/null 2>&1; then
  safe systemd-machine-id-setup
elif command -v dbus-uuidgen >/dev/null 2>&1; then
  safe dbus-uuidgen --ensure=/etc/machine-id
elif command -v uuidgen >/dev/null 2>&1; then
  uuidgen | tr -d '-' | tr '[:upper:]' '[:lower:]' > /etc/machine-id || true
else
  head -c16 /dev/urandom | od -An -tx1 | tr -d ' \n' | tr '[:upper:]' '[:lower:]' > /etc/machine-id || true
fi

safe chmod 0644 /etc/machine-id

safe rm -f /etc/ssh/ssh_host_*
if command -v ssh-keygen >/dev/null 2>&1; then
  safe ssh-keygen -A
fi

HOST="$(generate_hostname)"
[ -z "$HOST" ] && HOST="$(tr -dc 'a-z0-9' </dev/urandom | head -c8)"

printf '%s\n' "$HOST" > /etc/hostname.tmp && safe mv /etc/hostname.tmp /etc/hostname

if grep -q '^127\.0\.1\.1' /etc/hosts 2>/dev/null; then
  safe sed -i "s/^127\.0\.1\.1.*/127.0.1.1	$HOST/" /etc/hosts
else
  printf '\n127.0.1.1\t%s\n' "$HOST" >> /etc/hosts || true
fi

safe hostname "$HOST"
safe chmod 0644 /etc/hostname /etc/hosts

safe rm -f /var/lib/systemd/random-seed
if command -v systemd-random-seed >/dev/null 2>&1; then
  safe systemd-random-seed save
fi

exit 0
