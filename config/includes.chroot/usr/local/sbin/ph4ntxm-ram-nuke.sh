#!/bin/sh
set -e

if [ "$(cat /sys/kernel/kexec_crash_loaded 2>/dev/null)" = "1" ]; then
    exit 0
fi

exec /usr/sbin/kexec -p /boot/nuke/vmlinuz-nuke \
  --initrd=/boot/nuke/initrd-nuke.img \
  --command-line="crashkernel=256M iomem=relaxed nokaslr nosmap nosmep panic=-1 quiet loglevel=0"
