# PH4NTXM — Official Distribution

**Freedom • Security • Anonymity • Purpose • Pentest-Ready**

---

## OVERVIEW

PH4NTXM is a live-only operating system engineered for operators, researchers, and security professionals who require total control of their runtime environment.  
It executes from volatile memory, leaves no trace, and never communicates without explicit user authorization.

No persistence. No installation.  
Each session is a sealed, disposable environment — hardened, self-contained, and isolated from the host.

---

## SYSTEM ARCHITECTURE

- **Live-only execution** — all sessions are temporary and self-erasing  
- **Debian 13 (Trixie) XFCE base** — stable, minimal, and performance-optimized  
- **Hardened kernel** with mitigations against privilege escalation and data leaks  
- **Deny-first firewall** and nftables policy enforced at boot  
- **Network isolation and rate limiting** integrated at system level

---

## SECURITY FRAMEWORK

**Network Fingerprint Randomization**  
Randomizes TCP/IP signatures, TTL, timestamps, and related identifiers to reduce fingerprint correlation.

**Dynamic Identity Layer**  
Randomizes hostname, MAC address, machine ID, and SSH host keys at each boot.

**Rotating DNS Resolver System**  
Applies a random resolver from on startup to prevent DNS correlation.

**Clock Skewing Mechanism**  
Applies micro-randomized clock offsets at boot to obscure temporal fingerprinting.

**Fail2Ban and Brute-Force Defense**  
Custom jail configuration with transient ban, everything shown on live monitor tray.

**Live Threat Monitor**  
A lightweight service that continuously analyzes authentication, firewall, and intrusion logs. When suspicious activity is detected, it surfaces a real-time alert in the system tray — minimal, silent, and fully local. No data leaves the machine; awareness stays on the operator’s side.

**Lockdown Mode**  
Root-guarded network isolation toggle — cuts all connections instantly and restores only on command.

**Panic Button**  
Immediate termination of all network interfaces and processes, followed by secure memory clearing and forced shutdown.

---

## OPERATIONAL TOOLSET

PH4NTXM includes a curated, minimal toolkit purpose-built for operational readiness:  

- Network control and packet inspection utilities  
- Forensic and system integrity analysis tools  
- Secure communication and routing layers  
- Hardware identity randomization and anonymity frameworks  
- Reconnaissance, analysis, and exploitation toolsets  
- Sandbox and defensive assessment utilities  

Each component is intentional — no redundancy, no excess.  
Simplicity, transparency, and verifiability are prioritized above convenience.

---

## DESIGN PRINCIPLES

1. **Security by design** — protection is intrinsic, not optional.  
2. **Stateless operation** — nothing persists without user intent.  
3. **Transparency** — every process is auditable, every layer verifiable.  

PH4NTXM is not optimized for comfort. It is engineered for certainty.

---

## BUILD INFORMATION

- **Release:** PH4NTXM 1.1 — Alien Flux 
- **Image:** `PH4NTXM-1.1-amd64.iso`  
- **Base:** Debian 13 “Trixie” XFCE  
- **Architecture:** amd64  
- **Type:** Live-only (installation not recommended for your security and system integrity)  
- **License:** GPLv3 – Fully open source and redistributable under the same terms.

---

## Security & Release Policy

For security reasons, **only the latest PH4NTXM release** is available for public download.  
Older versions are archived and **not maintained**, ensuring all users receive the most recent hardening and security patches.
