# UX critique and design decisions

The following is a desk review against Nielsen heuristics and the personas, **not participant feedback**.

| # | Screen | Finding / heuristic | Decision | Why |
|---|---|---|---|---|
| 1 | S01 | Main focus CTA could be hidden among metrics (H8) | ACCEPT: hero with single primary CTA | Faster start for busy users |
| 2 | S02 | Empty title with no explanation (H9) | ACCEPT: inline error & focus input | Support recovery |
| 3 | S05 | Fixed 25-minute timer excludes short breaks (H7) | ACCEPT: 15/25/45 options | Fit 15–45 minute free time |
| 4 | S06 | Early quit without confirmation loses progress (H5) | ACCEPT: confirmation dialog | Prevent accidental termination |
| 5 | S09 | Silent join action gives weak feedback (H1) | ACCEPT: joined state + toast | Visible system feedback |
| 6 | S08 | Endless feed idea distracts from hobby practice (H8) | REJECT: feed-first model | Keep focus on activities instead of engagement |
| 7 | S01/S03 | Deep hamburger navigation would obscure daily tasks (H6) | MODIFY: bottom nav of 4 | Visibility and recognition |

## Local prototype improvement cycles
1. Navigation/CTA hierarchy: wireframe Home → emphasized single primary hero action.
2. Flexibility: wireframe Focus Setup → explicit 15/25/45 selection.
3. Error recovery: bare empty form → inline error with actionable message.

These are **local design iterations** with reference screenshots; they do **not** constitute captured Google Stitch generations.

## Review checklist (preliminary, not formal audit)
- [x] Main CTA identified; inline validation; return paths present.
- [x] Manual viewport render 360px and 412px.
- [x] Buttons for major interactions generally >=48px.
- [ ] All metadata normalized to >=14sp in Figma/Flutter.
- [ ] Full token binding into Figma Variables and instances.
- [ ] Manual WCAG audit of every text and control contrast; accessibility study.
