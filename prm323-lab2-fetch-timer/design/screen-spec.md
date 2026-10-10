# Screen specifications

| ID | Tên | Nội dung | Flow | CTA/interaction |
|---|---|---|---|---|
| S01 | Home | greeting, streak, focus hero, daily tasks | F01/2/3 | create, focus, schedule |
| S02 | Create activity | title required, interest type, time | F01 | save; inline error |
| S03 | Schedule | 5-day strip, timeline, cards | F01 | detail, create |
| S04 | Activity detail | time, reminder, category | F01/2 | focus/back |
| S05 | Focus setup | 15/25/45 durations, optional audio | F02 | start |
| S06 | Focus running | clock, pause, finish, early end | F02 | finish/quit overlay |
| S07 | Focus summary | session stats, completion | F02 | home/restart |
| S08 | Community | group search, suggested groups | F03 | group details |
| S09 | Group detail | description, events, members | F03 | join overlay |
| S10 | Profile | habits, focus stats, interests | support | explore groups |

## Global behavior
Bottom nav available across screens. Back uses prior navigation stack (fallback Home). Loading appears before S07. Validation appears inline; no dead-end. Content is scrollable, nav remains visible.

## Demo-only limits
No persistence across refresh, no real notifications, no backend, no network, no user upload, no Spotify/YouTube integration. Search is placeholder; do not present as real search.
