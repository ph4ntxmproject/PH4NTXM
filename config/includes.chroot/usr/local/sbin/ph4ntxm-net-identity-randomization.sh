#!/usr/bin/env bash
set -euo pipefail

rand_pick() {
  local arr=("$@")
  printf '%s' "${arr[$(od -An -N1 -tu1 /dev/urandom | tr -d ' ' | awk "{print \$1 % ${#arr[@]}}")]}"
}

rand_range() {
  local min=$1 max=$2
  echo $(( min + ( $(od -An -N2 -tu2 /dev/urandom | tr -d ' ') % (max - min + 1) ) ))
}

TTL="$(rand_pick 64 128)"
ICWND="$(rand_range 8 12)"
LOW="$(rand_range 20000 30000)"
HIGH="$(rand_range 61000 65535)"

nft delete table inet ph4ntxm_netid 2>/dev/null || true
nft add table inet ph4ntxm_netid
nft add chain inet ph4ntxm_netid postrouting '{ type filter hook postrouting priority mangle ; }'
nft add rule inet ph4ntxm_netid postrouting ip ttl set "$TTL"
nft add rule inet ph4ntxm_netid postrouting ip6 hoplimit set "$TTL"

if [[ -e /proc/sys/net/ipv4/tcp_initcwnd ]]; then
  sysctl -w net.ipv4.tcp_initcwnd="$ICWND"
fi

sysctl -w net.ipv4.ip_local_port_range="$LOW $HIGH"
sysctl -w net.ipv4.tcp_timestamps=1
sysctl -w net.ipv4.tcp_sack=1
sysctl -w net.ipv4.tcp_window_scaling=1

exit 0
