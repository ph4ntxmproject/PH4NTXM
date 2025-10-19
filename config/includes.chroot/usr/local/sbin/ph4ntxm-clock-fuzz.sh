#!/bin/bash
set -e

RUN_DIR=/run/ph4ntxm
OFFSET_FILE="$RUN_DIR/clock-offset-ms"

mkdir -p "$RUN_DIR"
OFFSET_MS=$(( (RANDOM % 3001) - 1500 ))

EPOCH=$(date +%s)
NEW_EPOCH=$(awk -v e="$EPOCH" -v o="$OFFSET_MS" 'BEGIN{printf("%.3f", e + o/1000)}')

printf '%d\n' "$OFFSET_MS" > "$OFFSET_FILE"
chmod 644 "$OFFSET_FILE" || true

date -s "@$NEW_EPOCH" >/dev/null 2>&1 || true

exit 0
