# PH4NTXM

**PH4NTXM** is a live-only, stateless Linux operating system engineered for hostile and forensic-adversarial environments.
It enforces amnesia by design: no persistence, no safe shutdown, no stable identity, and no reliable memory after exit.

PH4NTXM abandons the assumption that systems should recover.

---

## What PH4NTXM Is

PH4NTXM boots into a fully functional Linux environment intended to exist briefly and then disappear.

Each session is isolated, volatile, and disposable.
Shutdown, reboot, panic, and failure are treated as compromise events and are routed through enforced destruction paths.

The system is designed so that nothing meaningful survives the session.

---

## Operating Assumptions

PH4NTXM is designed for environments where:

* Post-mortem analysis is expected rather than hypothetical
* Hardware cannot be fully trusted
* Memory may be captured or inspected
* Identity correlation across sessions is a real threat
* Failure must not preserve state

---

## System Orientation

PH4NTXM is engineered around volatility and controlled termination.

The system favors clean session boundaries, enforced teardown, and ephemeral execution over continuity or accumulation.
Its behavior reflects the assumption that recovery, retention, and long-lived state increase risk rather than reduce it.

---

## System Guarantees

PH4NTXM is engineered to maintain the following conditions:

* **Stateless operation**
  System, user, and network state are not expected to survive reboot.

* **No safe exit paths**
  Poweroff, reboot, panic, and crash converge on the same enforced memory destruction mechanism.

* **Forensic resistance**
  System memory is actively polluted with plausible but false artifacts, making post-mortem analysis unreliable and non-deterministic.

* **Ephemeral identity**
  Hostname, machine identifiers, cryptographic material, network fingerprints, and timing behavior are regenerated every session.

* **Silent hardware surfaces**
  Selected physical sensors (such as microphone, camera, and audio output) are removed at the kernel level and are inaccessible to userspace.

These properties are enforced architecturally, not exposed as user options.

---

## How the System Is Structured

PH4NTXM is assembled so that evading destruction is difficult by design:

* **Live execution base**
  A reproducible, auditable system that operates entirely from volatile memory.

* **Last-resort kernel**
  A dedicated panic (“nuke”) kernel is invoked via `kexec` to guarantee memory disposal independent of userland state.

* **Enforcement layer**
  Mandatory system services responsible for memory contamination, identity rotation, network and clock disruption, and control of shutdown paths.

* **Operator controls**
  Explicit tools for panic shutdown, network lockdown, and inspection of the current session identity.

Initialization and shutdown are wired so that partial failure still converges on erasure.

---

## Live-Only Operation

PH4NTXM is engineered to operate exclusively in live mode.

The system treats state as disposable by design. Shutdown, reboot, and failure paths favor teardown over recovery, and volatile data is not preserved between sessions. This behavior is intentional and central to the system’s threat model.

Installation to internal storage or use in unsupported persistent virtualization environments is not part of the intended design and may alter or weaken the system’s security guarantees.

Each session begins clean and ends clean.
Operators are expected to verify image integrity, audit the build when possible, and treat any persistent media as hostile by default.

---

## Legal and Responsible Use

PH4NTXM is provided for lawful security research, system auditing, and authorized testing.

Use of the system or any included tools against infrastructure without explicit permission from its owners may be unlawful.
All responsibility for usage rests with the operator.

Complete legal notice terms are provided in the **`LEGAL-NOTICE.md`** file in the Github repository and are also distributed unchanged alongside official PH4NTXM release artifacts.

---

## Project Status

PH4NTXM is a security-focused, research-driven operating system.

* Actively developed
* Intentionally sharp-edged
* Subject to breaking changes
* Provided without warranty

It assumes an informed and competent operator.

---

## License

PH4NTXM is fully open source.

* Custom scripts and system components: **GNU GPLv3**
* Documentation and artwork: **CC BY-SA 4.0**
* Upstream software: distributed under their respective licenses

Complete licensing terms are provided in the **`LICENSE`** file in the Github repository and are included unchanged with all official PH4NTXM release artifacts.