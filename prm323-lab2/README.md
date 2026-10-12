# Fetch Timer — PRM323 Lab 2

Ứng dụng di động giúp sinh viên duy trì sở thích bằng lịch cá nhân, Focus Timer và cộng đồng. **Serene** là tên giao diện/prototype trong các file nguồn; bộ nộp dùng tên sản phẩm **Fetch Timer**.

- Persona chính: Minh, 21 tuổi, sinh viên, lịch học thay đổi và muốn luyện Guitar/đọc sách đều đặn. Đây là proto-persona.
- Repo dự kiến: `prm323-lab2-se184250`. Nhóm cần bổ sung URL GitHub sau khi tự tải bộ này lên, chưa có repo được tạo hoặc công bố trong tác vụ này.
- [Figma](https://www.figma.com/design/g4p29ANokap1mBOCWq9AJC/Untitled?node-id=0-1)
- [Stitch](https://stitch.withgoogle.com/projects/9577982156797592055)
- [Chat nguồn người dùng cung cấp](https://chatgpt.com/share/6acba35d-383c-83ec-a8ca-66a5068bd1a0) — chưa truy xuất được nội dung, không dùng làm bằng chứng prompt nguyên văn.
- Thành viên: Người 1 / Người 2 / Người 3 / Người 4. Thay bằng tên thật trước khi trình bày.

## Ba flow chính đã chốt

| Flow | Hành trình | Kết quả cần thấy |
|---|---|---|
| F1 | Home, tạo hobby, đặt hoạt động, xem lịch ngày | Hobby có mục tiêu và hoạt động đúng ngày/giờ |
| F2 | Chọn hobby, thiết lập Focus, chạy/tạm dừng/tiếp tục, tổng kết | Phiên gắn đúng hobby và thời lượng thực tế |
| F3 | Chia sẻ hobby, tìm cộng đồng, tham gia nhóm, tham gia thử thách | Bài xuất hiện và trạng thái đã tham gia/tiến độ rõ |

Các tài liệu cũ từng đánh số Cộng đồng là Flow 02 và Focus là Flow 03. Bộ này dùng thứ tự mới của người dùng, không đổi mã màn hình M01–M44.

## Tìm minh chứng

| Nội dung | Đường dẫn |
|---|---|
| Persona, problem, tiêu chí đo | [ux/persona.md](ux/persona.md) |
| IA, 3 sơ đồ có nhánh, mapping | [ux/user-flow.md](ux/user-flow.md) |
| Design brief và token | [design/DESIGN.md](design/DESIGN.md) |
| Đặc tả 44 màn hình | [design/screen-spec.md](design/screen-spec.md) |
| Quyết định, accessibility | [design/design-decisions.md](design/design-decisions.md) |
| Log AI, giới hạn nguồn | [ai/ai-design-log.md](ai/ai-design-log.md) |
| Phản biện AI có 10 phát hiện | [ai/ux-critique.md](ai/ux-critique.md) |
| Handoff Flutter 6 mục/màn | [handoff/flutter-handoff.md](handoff/flutter-handoff.md) |
| Ảnh Stitch gốc / Figma xuất trực tiếp | assets/stitch / assets/figma |
| Nguồn, SHA-256 và mức kiểm chứng | [evidence/source-register.md](evidence/source-register.md) |
| Checklist đối chiếu đề | [evidence/submission-checklist.md](evidence/submission-checklist.md) |
| Slide PowerPoint | [Fetch_Timer_PRM323_Lab2_Final.pptx](presentation/Fetch_Timer_PRM323_Lab2_Final.pptx) |
| Slide PDF | [Fetch_Timer_PRM323_Lab2_Final.pdf](presentation/Fetch_Timer_PRM323_Lab2_Final.pdf) |
| Kịch bản 4 người | [presentation/kich-ban-4-nguoi.md](presentation/kich-ban-4-nguoi.md) |
| Kịch bản bấm, kết quả mong đợi | [presentation/demo-runbook.md](presentation/demo-runbook.md) |
| Bản HTML người dùng cung cấp | demo/Serene_Prototype.html |

## Khai báo AI

Google Stitch: sinh UI trong 5 gói ZIP. ChatGPT/Codex: tổng hợp tài liệu, phản biện UI, soạn prompt cải tiến mới, tạo slide và handoff. Figma: nhập/dựng UI và xuất minh chứng; không tự coi công cụ Figma là AI. Không có bằng chứng sử dụng công cụ AI khác trong lần này.

## Trạng thái trung thực của bộ nộp

Đã có 44 ảnh màn hình chức năng + M00 từ Stitch và 9 PNG xuất trực tiếp từ Figma. Đã soạn đủ tài liệu Markdown, sơ đồ và đặc tả. 5 ZIP là **các nhóm màn hình**, không phải 5 vòng cải tiến.

**Chưa thể chứng nhận hoàn thành rubric**: thiếu prompt lịch sử nguyên văn và ≥3 cặp before/after có truy vết. Figma được đọc trực tiếp có 5 page (`Overview`, `Lịch trình`, `Tập trung`, `Cộng đồng`, `Cá nhân`) và khung 390×844, chưa đúng 6 page / 360×800 trong đề. Chưa kiểm chứng full wiring, Variables, component variants, overlay và loading→result. Có ảnh Figma thiếu nội dung ảnh so với Stitch và M18 có chữ chồng nhau. Xem checklist để hoàn tất trước nộp.

Bản HTML chỉ hỗ trợ demo dự phòng. Nó không thay minh chứng Figma theo đề. Kịch bản mô tả kết quả mong đợi, không phải biên bản kiểm thử đã đạt. Không viết Flutter code trong Lab 2.
