# AUREON

AUREON is an iPhone-only MVP for elite consultants in Portugal. It is positioned as a premium execution OS rather than a CRM: focused on momentum, decision clarity, and highest-value opportunities.

## Product blueprint

### Positioning
- **Audience:** experienced consultants, especially real-estate professionals handling multiple parallel deals.
- **Promise:** open the app and know what matters today, what is slipping, where the money is, and what to do next.
- **Design intent:** discreet luxury, editorial spacing, dark mode first, minimal friction, maximum clarity.

### MVP decisions
- **Navigation:** refined tab shell with five tabs — Hoje, Ações, Oportunidades, Inteligência, Perfil — plus a floating premium quick-add button for ultra-fast capture.
- **Local-first:** all data is sourced from mock repositories and pure services, keeping future backend integration straightforward.
- **Recommendation-led UX:** every main screen emphasizes suggested next steps over configuration or dense admin workflows.
- **Portuguese market fit:** PT-PT copy, euro formatting, and Portuguese date conventions are used throughout the architecture.

## Architecture

- `App`: app entry, root shell, navigation state.
- `DesignSystem`: colors, typography, spacing, and reusable UI components.
- `Domain`: business models and enums.
- `Data`: mock data plus repositories backing the MVP.
- `Services`: prioritization, parsing, formatting, and insight generation.
- `Features`: isolated SwiftUI screens and view models.
- `PreviewSupport`: convenient preview composition.

## Build notes

This repository now contains a SwiftUI-ready folder structure and production-minded starter code intended to be dropped into an Xcode iOS app target named **AUREON**. Because the current environment is Linux, SwiftUI/iOS compilation could not be executed here.
