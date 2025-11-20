# PH4NTXM — Official Distribution

**Freedom • Security • Anonymity • Purpose • Pentest-Ready**

---

## OVERVIEW

PH4NTXM 1.2 “Dark Matter” refines the system into a smaller, faster, and more autonomous framework.
This release reduces total size to **2.0 GB** and integrates a new translucent panel for cleaner visual cohesion.

Every byte, boot process, and service has been re-evaluated for stealth, consistency, and operator speed.
Dark Matter represents density — the invisible structure that holds everything together while revealing nothing.

---

## SYSTEM ARCHITECTURE

* **Live-only execution** — zero persistence, total volatility
* **Debian 13 (Trixie) XFCE base** — retained for stability and auditability
* **Kernel hardening and firewall defaults** — optimized for minimal surface exposure
* **Parallelized system services** — faster boot and lower idle footprint
* **Optimized system weight** — lighter ISO, fewer dependencies, tighter runtime

---

## SECURITY FRAMEWORK

**Lockdown Mode**
A root-protected isolation toggle that disables all network interfaces instantly, remaining sealed until manually reactivated.

**Panic Button**
Emergency failsafe that kills all user processes, wipes caches and memory, cuts network interfaces, and powers down securely.

**Dynamic Identity Obfuscation**
Rotates hostname, MAC addresses, machine-id, and SSH keys at each boot to prevent host-level correlation.

**Network Fingerprint Randomization**
Modifies TCP/IP stack parameters (TTL, timestamps, and signature behavior) to obscure network fingerprints.

**Rotating DNS Resolver System**
Selects a randomized resolver at boot to reduce DNS-route linkage between sessions.

**Clock Skewing Mechanism**
Applies subtle randomized time offsets during startup to hinder time-based fingerprinting.

**Firewall & Brute-Force Defense**
UFW defaults refined; Fail2Ban operates with ephemeral RAM-based ban logs — no persistence, no leftover data.

---

## INTERFACE & WORKFLOW

* **Transparent panel** — new semi-translucent interface blending with the desktop for low-distraction focus
* **Neon-Dark theme** — improved contrast and glow dynamics for low-light clarity
* **Icon Evolution** — broad overhaul of system and tool icons, covering security, anonymity, pentest utilities and core UI elements
* **Reactive PH4NTXM icons** — Lockdown, and Panic with glow-state indicators
* **Whisker Menu** — retained for speed and logical category structure
* **Brave Browser default** — lighter footprint, hardened privacy baseline

---

## OPERATIONAL TOOLSET

PH4NTXM retains all essential network, forensic, and anonymity utilities while removing redundancy for faster runtime validation and more predictable execution.
Streamlined — yet complete.

---

## DESIGN PRINCIPLES

1. **Security by default** — protections active from first boot
2. **Stateless operation** — all logs and identifiers are ephemeral
3. **Operator sovereignty** — no telemetry, no silent communication
4. **Verifiability** — open source, auditable, and transparent

PH4NTXM is engineered for certainty, not comfort.

---

## BUILD INFORMATION

* **Release:** PH4NTXM 1.2 — Dark Matter
* **Image:** `PH4NTXM-1.2-amd64.iso`
* **Base:** Debian 13 “Trixie” XFCE
* **Architecture:** amd64
* **Size:** 2.0 GB
* **Release Date:** 2025-11-17
* **Type:** Live-only (installation not recommended for your security and system integrity)
* **Checksum (SHA256):** `35f219add249c1b5d6fcd6c618e765e0c04cee0098d9094fb3fc2b380df8cd25`
* **License:** GPLv3 – Fully open source and redistributable under the same terms
* **Source Repository:** [https://github.com/ph4ntxmproject/PH4NTXM](https://github.com/ph4ntxmproject/PH4NTXM)

---

## SECURITY & RELEASE POLICY

For operational integrity, **only the latest PH4NTXM release** is available for download.
Older versions are archived, **not maintained**, and should not be used for live operations.
Always verify checksums, audit builds, and assume persistence equals exposure.
PH4NTXM is engineered to run in live mode only.
Installation on a hard drive or unsupported virtualization configuration is not recommended and may void security guarantees.
