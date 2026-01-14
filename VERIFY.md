# PH4NTXM – VERIFICATION GUIDE

---

Always verify your download before using it.

## 1. Verify SHA256 checksum (Linux/macOS)

```bash
sha256sum -c PH4NTXM-<version>-amd64.iso.sha256
```

Expected output:

```
PH4NTXM-<version>-amd64.iso: OK
```

---

## 2. Verify SHA256 checksum (Windows, PowerShell)

```powershell
Get-FileHash .\PH4NTXM-<version>-amd64.iso -Algorithm SHA256
```

Compare the resulting hash with the value listed in:

```
PH4NTXM-<version>-amd64.iso.sha256
```

---

## 3. Verify GPG Signature

To confirm authenticity, use the PH4NTXM project’s public GPG key to verify the ISO signature file.

Get GPG public key (.asc) and the ISO signature (.asc) from the verification folder or project's GitHub.  
Then, verify the ISO file against its signature (`PH4NTXM-<version>-amd64.iso.asc`).

A successful verification will display a message confirming a good signature from: **PH4NTXM**

This proves the ISO image was signed by the official PH4NTXM maintainers and has not been altered.

---

## 4. Source Transparency

The complete build scripts, configuration files, and system sources are available publicly for inspection and reproduction at:

https://github.com/ph4ntxmproject/PH4NTXM
