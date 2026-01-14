# PH4NTXM 1.4.1 – CHANGELOG

---

Version 1.4.1 – Event Horizon

Release Date: 2026-01-14

Highlights:

Packaging Corrections:  
Removed non-applicable system audit utilities that generated misleading results in a live, ephemeral environment.

Dependency Fix:  
Resolved a missing package dependency required for bundled tools to function correctly.

Packaging Expansion:  
Corrected an incomplete dependency set from 1.4 by including required runtime libraries and tool dependencies.  
This results in an increased ISO size (~300 MB) to ensure all bundled tools function correctly in live operation.

Notes:

PH4NTXM 1.4.1 is a corrective hotfix to the 1.4 release.  
No changes were made to core system behavior, threat model, kernel logic, or destruction paths.  
Version 1.4 is superseded by this release.

---

# PH4NTXM 1.4 – CHANGELOG

---

Version 1.4 – Event Horizon

Release Date: 2026-01-12

Highlights:

Nuke Kernel:  
A dedicated panic kernel is now embedded into all reboot and shutdown paths.  
CPU execution state and RAM are discarded before firmware resumes, preventing state persistence between sessions.

RAM Seeding Engine:  
A continuous low-footprint RAM seeding engine injects plausible cryptographic and application artifacts into memory.  
Allocator reuse spreads this noise across live process space, making memory analysis statistically unreliable.

Kernel-Level Sensor Lockdown:  
Microphone, camera, and audio output drivers are detached at the kernel level.  
These devices are inaccessible to userspace, browsers, or malware.

Network Behavior Deception:  
TCP characteristics including initial congestion window and timing cadence are subtly randomized during live sessions.  
Passive and semi-active fingerprinting tools observe inconsistent behavior without breaking connectivity.

Network Fingerprint Randomization:  
TTL values and ephemeral session parameters are continuously varied to disrupt correlation across boots and networks.

Desktop Environment Upgrade:  
Switched to the Midnight theme for reduced eye strain and improved long-session usability while retaining PH4NTXM visual identity.

System Slimming:  
ISO size reduced to approximately 1.7 GB through asset consolidation and base system trimming.

Notes:

PH4NTXM 1.4 represents a shift from identity reset to irreversible operational security.  
The system now enforces memory, hardware, and network guarantees at the kernel level.  
Every shutdown is final. Every session is statistically unique.

---

# PH4NTXM 1.3 – CHANGELOG

---

Version 1.3 – Zero Point

Release Date: 2025-12-12

Highlights:

Global Identity Randomization:  
Expanded corpus of international human names introduces natural personas at each boot, improving environmental blending and reducing behavioral correlation.

PH4NTXM Identity Utility:  
New read-only session indicator displaying hostname state, machine-id, MAC rotation, persona name, and other non-sensitive randomized session traits for quick operator verification.

System Hardening:  
Updated kernel configuration and firewall defaults reduce surface exposure; Fail2Ban remains fully RAM-bound for zero persistence.

Visual Unification:  
Complete shift to a cyan-dominant system palette; PH4NTXM tools recolored with neon cyan/magenta dual-tone for immediate operational recognition.

Interface Refinement:  
Transparent panels, reworked icon geometry, and low-light neon-dark theme increase interface legibility and reduce visual noise.

Performance Optimization:  
Boot services trimmed and parallelized for faster initialization; overall ISO size maintained at 2.0 GB despite feature expansion.

Notes:

PH4NTXM 1.3 resets the visual and operational baseline.  
Identity becomes adaptive, appearance becomes unified, and the environment becomes quieter without losing precision.  
Zero Point is a clean state — every boot begins as someone new.

---

# PH4NTXM 1.2 – CHANGELOG

---

Version 1.2 – Dark Matter

Release Date: 2025-11-17

Highlights:

System Refinement:  
Base size reduced to 2.0 GB through extensive cleanup and optimization. Streamlined environment without sacrificing tools or functionality.

Visual Identity:  
Unified neon-dark aesthetic with reactive icons and a new bottom panel for improved balance and usability.

Tool Design:  
Panic and Lockdown systems now feature distinct visual states for immediate feedback and clarity.

Security & Network:  
Firewall and anonymity subsystems further tuned for balanced performance and stealth during live sessions.

Performance:  
Faster boot and lower memory footprint enhance responsiveness across hardware.

Custom Icon Suite:  
Broad overhaul of system and tool icons, covering security, anonymity, pentest utilities and core UI elements.

Notes:

PH4NTXM 1.2 refines what 1.1 built — a system leaner, quieter, and sharper.  
Every element was re-tuned for purpose: reduced weight, improved control, and stronger visual coherence.  
Still live-only. Still forensic-safe. Still PH4NTXM.

---

# PH4NTXM 1.1 – CHANGELOG

---

Version 1.1 – Alien Flux

Release Date: 2025-10-15

Highlights:

Anonymity & Identity Obfuscation:  
Dynamic unique randomization of network fingerprint, hostname, MAC address, SSH keys,machine ID.

Network Privacy:  
Rotating DNS resolvers and subtle clock skewing to prevent time-based and network-pattern correlation.

Interface & Visual Overhaul:  
Complete shift to Neon visuals with matching neon cursors and icons; updated GRUB splash and background for a cohesive aesthetic.

Menu & Workflow Upgrade:  
Replaced default menu with Whisker Menu for faster navigation, balanced blue–purple neon color scheme across all panels.

Firewall & Compatibility:  
UFW refined for balanced security; essential pentesting utilities fully operational without compromising protection.

Notes:

PH4NTXM 1.1 marks a major step forward—unifying anonymity, polish, and user experience. The system now boots cleaner,  
looks sharper, and operates with greater stealth while preserving its live-only, forensic-safe foundation.

---

# PH4NTXM 1.0 – CHANGELOG

---

Version 1.0 – PH4NTXM

Release Date: 2025-10-10

Highlights:

Security & Privacy:  
Enhanced kernel hardening, firewall defaults, and privacy-focused optimizations.

Pentesting Environment:  
Streamlined workflow with curated offensive and defensive tools, ready for real engagements.

System Performance & Stability:  
Optimized for live usage, faster boot, responsive UI, and robust session handling.

Integrated Features:  
Panic Button, and Lockdown Mode fully operational with persistent live states.

Branding & Custom Configurations:  
PH4NTXM-specific UI and toolset branding for clarity and professionalism.

Integrity & Verification:  
SHA256 hashes provided; system designed to self-verify integrity at runtime.

Notes:

This release establishes a stable, secure foundation for operators.  
Future updates will expand tooling, refine configurations, and enhance documentation.  
Always prioritizing stability, privacy, and purposeful offensive capability.
