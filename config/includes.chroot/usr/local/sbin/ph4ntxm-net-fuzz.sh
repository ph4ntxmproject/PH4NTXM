#!/usr/bin/env bash
PATH=/usr/sbin:/usr/bin:/sbin:/bin
set -euo pipefail

EPOCH_MIN=10
EPOCH_MAX=25

have_net() {
    ip route get 1.1.1.1 &>/dev/null
}

rand_between() {
    shuf -i "$1-$2" -n 1
}

apply_epoch() {
    local epoch
    epoch="$(rand_between "$EPOCH_MIN" "$EPOCH_MAX")"
    sleep "${epoch}m"
}

for _ in {1..30}; do
    have_net && break
    sleep 1
done

have_net || exit 0

while true; do
    apply_epoch
done
