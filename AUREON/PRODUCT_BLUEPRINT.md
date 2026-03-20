# AUREON Product Blueprint

## 1. Product summary
AUREON is a premium execution OS for elite consultants in Portugal. The product is intentionally narrow: it reduces operational noise, surfaces the best next move, and protects momentum across high-value opportunities.

## 2. Experience principles
- Speed before completeness.
- One decision at a time.
- Recommendation over configuration.
- Luxury through restraint.
- PT-PT tone with direct, concise copy.

## 3. MVP screens
1. **Access Gate / Onboarding** — premium entry, no carousel, direct access.
2. **Command Center** — daily clarity within five seconds.
3. **Actions** — prioritized execution list, not generic tasks.
4. **Opportunities** — lightweight pipeline with decisive context.
5. **Quick Add** — voice-like capture plus confirmation.
6. **Intelligence** — concise AI-style recommendations.
7. **Performance** — text-led accountability and restrained trend view.

## 4. Design system definition
- **Palette:** black background, graphite surfaces, off-white typography, restrained gold accent.
- **Typography:** large headline treatment, strong numerics, rounded body text, editorial hierarchy.
- **Spacing:** 4/8/12/16/20/24/32 scale.
- **Components:** premium cards, bold CTA button, minimal chips, score ring.
- **Motion direction:** subtle, spring-light, no playful excess.

## 5. Core logic
- Prioritize actions by financial impact, urgency, confidence, and inactivity.
- Generate risk insights when high-value opportunities go untouched for 5+ days.
- Create decision prompts when meetings lack a defined next step.
- Flag low-value focus drift when smaller tasks dominate the queue.

## 6. PT-PT interface copy
- "Execução acima do ruído."
- "Tens 3 ações críticas hoje"
- "Este negócio está a perder força"
- "Liga hoje"
- "Próximo passo em falta"
- "Execução da semana"
- "Captura imediata, sem atrito"

## 7. Next implementation steps
1. Create an iOS Xcode app target named `AUREON` and add all files under the `AUREON/` directory.
2. Split feature subcomponents further where interaction detail grows.
3. Replace mock repositories with persistence abstractions and backend contracts.
4. Add Voice framework / Speech integration for real capture.
5. Add snapshot/UI tests for tab shell, quick add flow, and command center states.
