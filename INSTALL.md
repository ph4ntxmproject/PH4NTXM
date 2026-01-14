==========================================================================================================
PH4NTXM – INSTALLATION GUIDE
==========================================================================================================

1. Requirements

   • 64-bit PC (x86_64)
   • Minimum 2 GB RAM (4 GB recommended)
   • 4 GB USB stick or DVD
   • Internet connection (optional, for updates or additional tools)

2. Creating a Bootable USB (Linux)

   • WARNING: This will erase the target USB drive.
   • Replace /dev/sdX with the correct device for your USB.
   • sudo dd if=PH4NTXM-<version>-amd64.iso of=/dev/sdX bs=4M status=progress oflag=sync

   Tip: Run "lsblk" before and after plugging in your USB to identify /dev/sdX.

3. Creating a Bootable USB (Windows)
   • Download Rufus (https://rufus.ie).
   • Insert your USB drive.
   • Select the PH4NTXM ISO, choose "DD mode" if prompted.
   • Click Start.

4. Creating a Bootable DVD
   • Burn the ISO using your preferred DVD writing tool.

5. Booting
   • Reboot the system and enter the boot menu (usually F12, ESC, or DEL).
   • Select your USB/DVD.
   • Choose "PH4NTXM GNU/Linux (Live)".

6. Important Notice — Live-Only Operation

PH4NTXM is engineered to run in live mode only.
It does not include an installer, by design.
Each boot starts with a clean, isolated environment — nothing persists to disk.

This model ensures system integrity, prevents hidden modification, and protects the operator’s privacy.

Installation on a hard drive or virtual machine is not supported or recommended.
Doing so would compromise the intended security guarantees and operational behavior.

PH4NTXM exists to be transient, verifiable, and secure — every session begins clean, and ends clean.