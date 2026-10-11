# AI design log — Fetch Timer

## Quy ước bằng chứng

Log này tách lịch sử **đã có trong đầu vào** khỏi prompt **mới đề xuất**. Không suy ra prompt lịch sử từ HTML. Không dùng cùng ảnh đổi tên before/after. 1.zip–5.zip là batch chức năng, không phải 5 vòng refine.

## A. Nguồn AI quan sát được

| Batch | Công cụ | Output giữ nguyên | Nội dung | Prompt nguyên văn lịch sử |
|---|---|---|---|---|
| 1 | Google Stitch | assets/stitch/M00–M02, M04, M05 | Quy chuẩn, Home, điều hướng | Chưa có |
| 2 | Google Stitch | M06–M14 | Hobby/lịch | Chưa có |
| 3 | Google Stitch | M25–M37 | Cộng đồng | Chưa có |
| 4 | Google Stitch | M03, M15–M19, M21–M24 | Focus/nhật ký | Chưa có |
| 5 | Google Stitch | M20, M38–M44 | Sửa kỷ niệm/cá nhân | Chưa có |

Ảnh và HTML gốc được chép nguyên trạng. [Manifest nguồn](../evidence/source-register.md). Không có metadata thời gian tạo chứng minh thứ tự cải tiến. Chat nguồn chưa truy cập được, cần lấy prompt thật từ Stitch/chat gốc để bổ sung.

## B. Phiên phản biện AI thực hiện trong lần chuẩn bị này

Công cụ: ChatGPT/Codex. Ngày 11/10/2026. Prompt nguyên văn và toàn bộ phản hồi được ghi tại [ux-critique.md](ux-critique.md). Phản hồi có C01–C10, gắn màn cụ thể, Nielsen/accessibility/persona, mức ưu tiên và cách kiểm chứng. Quyết định D01–D10 tại [design-decisions.md](../design/design-decisions.md). Đây là log phản biện mới, không phải vòng đã sửa Figma.

## C. Ba vòng tinh chỉnh có mục tiêu khác nhau — đã soạn prompt, CHƯA có output sau

| Vòng dự kiến | Vấn đề | Before có sẵn | Prompt mới | After | Quyết định |
|---|---|---|---|---|---|
| R1 | Layout/accessibility 360/412, chữ/tap/contrast | M01/M02/M07/M10 hiện tại | prompts/01-layout-accessibility.txt | Chưa được tạo/kiểm chứng | Modify D03/D09 |
| R2 | Phòng ngừa lỗi và phục hồi lịch | M07/M10 hiện tại | prompts/02-calendar-error-recovery.txt | Chưa được tạo/kiểm chứng | Modify D05 |
| R3 | Focus ghi thời lượng thực, không mất phiên | M16/M18/M24 hiện tại | prompts/03-focus-actual-time.txt | Chưa được tạo/kiểm chứng | Modify D06/D08 |

[Brief mới](prompts/00-brief-moi.txt) dùng cho các lần sinh tiếp theo, không nhận là prompt gốc. Ba prompt hoàn chỉnh nằm trong các file liên kết, chưa gửi Google Stitch trong tác vụ tạo bộ tài liệu này.

## D. Cách bổ sung mỗi vòng để đủ rubric

1. Chép nguyên văn prompt đã gửi, tool/model và thời gian thật.
2. Chụp before đúng màn và giữ nguyên output AI sau khi gửi.
3. Ghi lại prompt critique và toàn bộ trả lời AI.
4. Ghi accept/modify/reject, lý do và node Figma đã đổi.
5. Lưu after cùng màn; ghi tiêu chí test và kết quả thực tế.

Mẫu entry: `Rxx — vấn đề`; `tool/time`; `prompt nguyên văn`; `output`; `before/after`; `critique`; `decision/reason`; `Figma node`; `verification`. Không đổi trạng thái bảng C thành hoàn thành trước khi có các bằng chứng này.
