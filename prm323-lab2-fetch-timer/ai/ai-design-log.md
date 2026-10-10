# AI design log / prompt register

## Integrity note
The local HTML prototype and its screenshots were prepared in this work session with ChatGPT-assisted authoring. **No real Google Stitch output or Stitch screenshots is claimed. The user-provided Figma file has now been reviewed and extended with clickable prototype flows.** Replace placeholders with genuine exported evidence before submitting against the original Lab 2 rubric.

## Initial prompt for Google Stitch — Prepared, not run
> Thiết kế UI/UX 10 màn hình cho ứng dụng mobile 'Fetch Timer – Hobby Tracker' (360×800 dp), dành cho sinh viên 20 tuổi lịch bận và người đi làm 27 tuổi muốn duy trì sở thích. Nội dung: Home S01, Create Activity S02, Schedule S03, Activity Detail S04, Focus Setup S05, Focus Timer S06, Focus Summary S07, Community S08, Group Detail S09, Profile S10. User flow: lập lịch (có validation error/recovery), focus (tạm dừng/overlay xác nhận/transition loading→summary), tham gia cộng đồng (dialog join/cancel). Phong cách premium-light, rõ ràng, human-centered; primary #4438C8, background #F7F8FD, ink #1A2541, cards #FFF, rounded 16–24 dp, padding 20 dp, bottom tab 4 mục, font Noto Sans. Hãy tạo UI hoàn chỉnh, mỗi màn có một CTA nổi bật; component nhất quán, các state empty/loading/error; mọi vùng chạm >=48dp, body >=14sp, contrast text >=4.5:1. Thiết kế để có thể dựng lại trong Figma bằng Auto Layout/Variables/Variants. Không tạo code Flutter.

## Critique prompt — Prepared desk review
> Phản biện từng màn S01–S10 theo 10 Nielsen heuristics, WCAG 2.1 (contrast/tap targets) và persona Minh Anh/Lan. Nêu >=5 phát hiện gắn screen cụ thể, mức độ, đề xuất sửa, quyết định accept/modify/reject và lý do. Không suy diễn thành kết quả phỏng vấn người dùng.

## Three iterations — local prototype evidence, not Stitch AI generations
- L1 'Primary CTA hierarchy': `diagrams/iteration_1.png`; before wire Home, after highlighted CTA.
- L2 'Focus flexibility': `diagrams/iteration_2.png`; before wire setup, after 15/25/45 selector.
- L3 'Error recovery': `diagrams/iteration_3.png`; before form default, after validation error.

## Evidence TODO when running Stitch/Figma
- [ ] exact prompt logs with timestamps / tool versions
- [ ] Stitch V0 PNG screenshots
- [ ] iterations V1, V2, V3 each before/after screenshots in `assets/stitch/`
- [ ] real Figma link + six pages + 10 editable screens + components bound to tokens
- [ ] real Figma prototype flow starting points
- [ ] GitHub public/viewable URL
