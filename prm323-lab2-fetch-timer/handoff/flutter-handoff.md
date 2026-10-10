# Flutter handoff — conceptual spec only, no Flutter code

## Base and navigation
Mobile base 360×800 dp, test 412 dp. Scaffold + persistent NavigationBar for four destinations; screens scroll independently, Back pops to previous screen then Home. Wider than 600 dp: center constrain content max 480 px, avoid stretching cards.

## Six headings per screen

### S01 Home
1. **Layout:** header → greeting → focus hero → metrics → daily cards. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** AppBar, HeroCard, StatCard, ActivityCard, NavigationBar.
3. **States:** populated, empty, loading.
4. **Interactions:** tap create/focus/activity/see all.
5. **Navigation:** to S02/S05/S04/S03; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S02 Create activity
1. **Layout:** app bar → headline → title field → interest chips → time → submit. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** TextField, SegmentedChoice, TimeField, FilledButton.
3. **States:** default, validation-error, saving.
4. **Interactions:** title required; on blank highlight inline error; on valid show confirmation.
5. **Navigation:** from Home/Schedule → S03; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S03 Schedule
1. **Layout:** app bar → day strip → timeline → add. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** DayChip, ActivityCard, FilledButton.
3. **States:** populated, empty, fetching-error.
4. **Interactions:** tap activity, add, change day (future implementation).
5. **Navigation:** S04/S02; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S04 Activity detail
1. **Layout:** back → icon → title/status → metadata cards → focus. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** AppBar, DetailCard, FilledButton.
3. **States:** scheduled, done, canceled (planned).
4. **Interactions:** start focus / return schedule.
5. **Navigation:** S05/S03; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S05 Focus setup
1. **Layout:** back → illustration/title → duration choice → sound suggestions → start. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** DurationChoice, SettingCard, FilledButton.
3. **States:** default, selected, disabled.
4. **Interactions:** select 15/25/45, start.
5. **Navigation:** S06; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S06 Focus timer
1. **Layout:** back → circular timer → pause → finish → early-end. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** TimerRing, FilledButton, Dialog.
3. **States:** running, paused, loading, confirm-quit.
4. **Interactions:** pause/resume; finish → loading; early exit dialog.
5. **Navigation:** S07 or S05; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S07 Focus summary
1. **Layout:** back → trophy → summary metrics → CTAs. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** SummaryCard, StatCard, FilledButton.
3. **States:** success, sync-error (planned).
4. **Interactions:** Home/restart.
5. **Navigation:** S01 or S05; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S08 Community
1. **Layout:** heading → search → group card list. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** SearchField, GroupCard, NavigationBar.
3. **States:** populated, empty, fetching-error.
4. **Interactions:** enter search, open group.
5. **Navigation:** S09; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S09 Group detail
1. **Layout:** back → cover → info → challenges → join. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** GroupCard, Dialog, FilledButton.
3. **States:** not-joined, confirm, joined.
4. **Interactions:** join → modal; confirm updates state; cancel closes.
5. **Navigation:** back S08; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

### S10 Profile
1. **Layout:** headline → identity card → stats → interests. Outer padding 20 dp, content scrollable; bottom nav persistent.
2. **Components:** ProfileCard, StatCard, InterestCard.
3. **States:** populated, empty-interest.
4. **Interactions:** navigate community.
5. **Navigation:** S08; Back returns previous screen/Home.
6. **UI constraints:** min touch 48×48 dp, content text >=14sp, preserve scroll with keyboard, avoid clipping at 360/412 dp, labels wrap to 2 lines.

## Token → Flutter
| Figma token | Value | Flutter target |
|---|---|---|
| color.primary | #0E8D68 | ColorScheme.primary |
| color.surface | #FFFFFF | ColorScheme.surface |
| color.background | #F8FBF7 | scaffoldBackgroundColor |
| color.text.primary | #131E1C | ColorScheme.onSurface |
| color.text.secondary | #5A6D67 | TextTheme.bodyMedium color |
| spacing.1,2,3,4,5,6,8 | 4,8,12,16,20,24,32 | AppSpacing constants |
| radius.card | 18 dp | BorderRadius.circular(18) |
| type.body | 15/22, Noto Sans | TextTheme.bodyMedium |
| elevation.card | subtle | BoxShadow or Card elevation |

## Component → Flutter
| Component | Flutter widget |
|---|---|
| Button | FilledButton / OutlinedButton |
| Text field | TextFormField |
| Card | Card / InkWell |
| Bottom navigation | NavigationBar |
| App bar | AppBar |
| Dialog | AlertDialog / showModalBottomSheet |
| Loading | CircularProgressIndicator |
| Empty | Column + text + FilledButton |
| Error | error label + retry button |

Notifications, external media, photos, social backend are out of prototype scope and require product/API spec before implementation.
