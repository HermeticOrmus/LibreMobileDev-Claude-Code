<p align="center">
  <img src="https://ormus.solutions/mascot/golden_swan.gif" alt="LibreMobileDev Claude Code" width="128" style="image-rendering: pixelated;" />
</p>

<h1 align="center">LibreMobileDev Claude Code</h1>

<p align="center">
  <em>Mobile app development with Claude Code — 20 plugins for Flutter, React Native, native iOS, native Android, and the operational layer between</em>
</p>

<p align="center">
  <a href="https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code/stargazers"><img src="https://img.shields.io/github/stars/HermeticOrmus/LibreMobileDev-Claude-Code?style=flat-square&color=aa8142" alt="Stars" /></a>
  <img src="https://img.shields.io/badge/Mobile-aa8142?style=flat-square&logo=flutter&logoColor=white" alt="Mobile" />
  <img src="https://img.shields.io/badge/Claude_Code-aa8142?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code" />
</p>

---

> **Skills, agents, commands, and workflows for mobile app development with Claude Code.**

Mobile is unforgiving. A single store rejection can delay launch by weeks. A memory leak ships to millions of users before you notice. Cross-platform engineering decisions (Flutter? React Native? Native?) lock in years of decisions. **LibreMobileDev gives Claude Code the mobile-specific expertise that web-focused AI coding lacks.**

Twenty plugins covering Flutter, React Native, native iOS (Swift/SwiftUI), native Android (Kotlin/Jetpack Compose), plus the operational layer (CI/CD, store optimization, payments, security, performance).

## The 20 plugins

### Frameworks

| Plugin | Domain |
|---|---|
| **flutter-development** ⭐ | Flutter 3.x, widgets, state management, platform channels, build modes |
| react-native | RN 0.7x+, new architecture (Fabric), navigation, native modules |
| swift-ios | SwiftUI, UIKit, Combine, Core Data, App Intents |
| kotlin-android | Jetpack Compose, Coroutines, Hilt, Room, Material 3 |
| cross-platform-patterns | When to share code, when not to, common abstractions |

### Performance + quality

| Plugin | Domain |
|---|---|
| mobile-performance | Startup time, jank profiling, memory leaks, battery |
| mobile-testing | Unit, widget, integration, E2E across platforms |
| mobile-architecture | MVVM, BLoC, Riverpod, Redux, clean architecture |
| accessibility-mobile | Screen readers, color contrast, gesture alternatives, dynamic type |
| offline-first | Local-first storage, sync, conflict resolution |

### Features + integrations

| Plugin | Domain |
|---|---|
| push-notifications | FCM, APNs, deep linking from notification, rich notifications |
| deep-linking | URL schemes, universal links / App Links, App Banner |
| camera-media | Camera APIs, image picker, video recording, codecs |
| location-services | GPS, geofencing, background location (with permission discipline) |
| gesture-interaction | Touch, swipe, pinch, custom gesture recognizers |
| mobile-payments | Apple Pay, Google Pay, IAP, third-party (Stripe SDKs) |

### Ops + distribution

| Plugin | Domain |
|---|---|
| mobile-ci-cd | Fastlane, Codemagic, Bitrise, GitHub Actions for mobile, code signing |
| app-store-optimization | Keyword research, screenshots, store reviews, ratings management |
| mobile-analytics | Mixpanel, Amplitude, Firebase Analytics, privacy-respecting alternatives |
| mobile-security | Cert pinning, keychain/keystore, jailbreak/root detection, OWASP Mobile Top 10 |

⭐ = depth-complete. Remaining 19 shell-improved.

## Quick start

```bash
git clone https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code.git ~/projects/LibreMobileDev-Claude-Code
cd ~/projects/LibreMobileDev-Claude-Code
./setup.sh
```

```
/flutter design a state management strategy for an app with ~50 screens, offline-first reads, online writes with conflict resolution, push notifications driving deep links into specific screens. Riverpod or BLoC?
```

See [QUICK_START.md](QUICK_START.md).

## Learning paths

- [Beginner](learning-paths/beginner.md) — mobile mindset, your first deployed app
- [Intermediate](learning-paths/intermediate.md) — store certification, CI/CD, analytics
- [Advanced](learning-paths/advanced.md) — offline-first, multi-platform code sharing, performance at scale

## Disclaimer

Building mobile apps for regulated domains has compliance requirements this kit doesn't replace (HIPAA, COPPA, GDPR consent). App Store + Play Store reviews enforce additional policies (privacy nutrition labels, ATT prompts, data safety section).

## License

MIT.

---

## Part of the Libre Open-Source Stack for Claude Code

This repository is part of a growing family of open-source toolkits for Claude Code.

### Libre suite — comprehensive plugin bundles

- [LibreUIUX-Claude-Code](https://github.com/HermeticOrmus/LibreUIUX-Claude-Code) — UI/UX development (152 agents, 70 plugins, 76 commands, 74 skills)
- [LibreArch-Claude-Code](https://github.com/HermeticOrmus/LibreArch-Claude-Code) — Software architecture and system design
- [LibreCopy-Claude-Code](https://github.com/HermeticOrmus/LibreCopy-Claude-Code) — Technical writing and documentation engineering
- [LibreDevOps-Claude-Code](https://github.com/HermeticOrmus/LibreDevOps-Claude-Code) — DevOps engineering and infrastructure automation
- [LibreEmbed-Claude-Code](https://github.com/HermeticOrmus/LibreEmbed-Claude-Code) — Embedded systems, firmware, and IoT development
- [LibreFinTech-Claude-Code](https://github.com/HermeticOrmus/LibreFinTech-Claude-Code) — Financial technology development
- [LibreGEO-Claude-Code](https://github.com/HermeticOrmus/LibreGEO-Claude-Code) — AI-search optimization (ChatGPT, Perplexity, Gemini, Google AI Overviews)
- [LibreGameDev-Claude-Code](https://github.com/HermeticOrmus/LibreGameDev-Claude-Code) — Game development across Godot, Unity, Unreal
- [LibreMLOps-Claude-Code](https://github.com/HermeticOrmus/LibreMLOps-Claude-Code) — ML engineering and AI operations
- [LibreSecOps-Claude-Code](https://github.com/HermeticOrmus/LibreSecOps-Claude-Code) — Security operations
- [LibreSessionFlow-Claude-Code](https://github.com/HermeticOrmus/LibreSessionFlow-Claude-Code) — Session lifecycle: handoff, pickup, absorb, explore, close

### Skills mini-repos — single CLAUDE.md drop-ins

- [vibe-engineer-skills](https://github.com/HermeticOrmus/vibe-engineer-skills) — Direct AI codegen well: hypothesis before help, scoped prompts, validate before accepting
- [markdown-discipline-skills](https://github.com/HermeticOrmus/markdown-discipline-skills) — Strip AI-slop from markdown (no em dashes, no marketing fluff)
- [shell-safety-skills](https://github.com/HermeticOrmus/shell-safety-skills) — `set -euo pipefail` discipline plus 15 failure-mode examples
- [commit-standard-skills](https://github.com/HermeticOrmus/commit-standard-skills) — Ormus Commit Standard v1.0 plus commit-msg hook and commitlint
- [unwoke-skills](https://github.com/HermeticOrmus/unwoke-skills) — Strip AI theater (ten sins to eliminate, symmetric engagement)
- [python-conventions-skills](https://github.com/HermeticOrmus/python-conventions-skills) — Modern Python 3.11+ (types, pathlib, async, ruff, mypy, uv)
- [typescript-conventions-skills](https://github.com/HermeticOrmus/typescript-conventions-skills) — TypeScript strict mode, discriminated unions, Result types
- [hermetic-laws-skills](https://github.com/HermeticOrmus/hermetic-laws-skills) — Seven Hermetic Principles applied to engineering
- [riper-workflow-skills](https://github.com/HermeticOrmus/riper-workflow-skills) — Research / Innovate / Plan / Execute / Review systematic dev
- [six-day-cycle-skills](https://github.com/HermeticOrmus/six-day-cycle-skills) — Sustainable shipping cadence with mandatory rest
- [token-optimization-skills](https://github.com/HermeticOrmus/token-optimization-skills) — Claude Code token and context optimization
- [osint-skills](https://github.com/HermeticOrmus/osint-skills) — OSINT research methodology (multi-wave investigative spiral)
- [calcinate-skills](https://github.com/HermeticOrmus/calcinate-skills) — Stage 1 of the Magnum Opus (burn project bloat)
- [claude-md-overhaul-skills](https://github.com/HermeticOrmus/claude-md-overhaul-skills) — Audit CLAUDE.md and MEMORY.md against caps
- [session-handoff-skills](https://github.com/HermeticOrmus/session-handoff-skills) — Session handoff and pickup discipline
- [naming-skills](https://github.com/HermeticOrmus/naming-skills) — Product naming methodology (mine the brand's vocabulary)
- [magnum-opus-skills](https://github.com/HermeticOrmus/magnum-opus-skills) — Seven-stage alchemy applied to project transformation
- [mem-search-skills](https://github.com/HermeticOrmus/mem-search-skills) — Search claude-mem cross-session memory: search, filter, fetch
- [hypothesis-debugging-skills](https://github.com/HermeticOrmus/hypothesis-debugging-skills) — Hypothesis-driven debugging: reproduce, isolate, test, fix
- [vibe-proof-skills](https://github.com/HermeticOrmus/vibe-proof-skills) — Security hardening for vibe-coded full-stack apps
- [tdd-skills](https://github.com/HermeticOrmus/tdd-skills) — Test-driven development (Red-Green-Refactor) for JS/TS and Python
- [mars-skills](https://github.com/HermeticOrmus/mars-skills) — Production-readiness audit: the five mortal sins of vibe-coded MVPs
- [git-workflow-skills](https://github.com/HermeticOrmus/git-workflow-skills) — Clean git workflow: branch, atomic commits, reviewable PRs
- [code-review-skills](https://github.com/HermeticOrmus/code-review-skills) — Domain-aware code review: classify the code, then focus
- [explore-code-skills](https://github.com/HermeticOrmus/explore-code-skills) — Understand an unfamiliar codebase fast
- [dx-audit-skills](https://github.com/HermeticOrmus/dx-audit-skills) — Audit developer experience: docs, onboarding, tooling friction
- [setup-env-skills](https://github.com/HermeticOrmus/setup-env-skills) — Set up a project's development environment
- [automate-skills](https://github.com/HermeticOrmus/automate-skills) — Turn repetitive tasks into reliable automation scripts
- [quick-fix-skills](https://github.com/HermeticOrmus/quick-fix-skills) — Fast troubleshooting for common issues
- [prime-context-skills](https://github.com/HermeticOrmus/prime-context-skills) — Prime project context at the start of a session
- [auto-docs-skills](https://github.com/HermeticOrmus/auto-docs-skills) — Generate and maintain project documentation
- [learning-skills](https://github.com/HermeticOrmus/learning-skills) — Learn any technology: roadmaps, explanations, practice, cheatsheets, comparisons
- [linux-sysadmin-skills](https://github.com/HermeticOrmus/linux-sysadmin-skills) — Linux system administration: security, performance, diagnostics, monitoring, maintenance

### Template source

- [andrej-karpathy-skills](https://github.com/HermeticOrmus/andrej-karpathy-skills) — the canonical single-file CLAUDE.md pattern (fork of jiayuan_jy's original)

Star the family, not just one — that's how the suite stays coherent.
