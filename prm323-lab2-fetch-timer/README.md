# Fetch Timer — PRM323 Lab 2 (Hobby Tracker)

**Trạng thái 08/10/2026:** File Figma Light UI gốc đã có 36 màn hình chức năng. Đã bổ sung **trang `09 — Prototype Flows`** ngay trong file Figma này (hub điều hướng + 18 bản sao màn hình editable + 44 prototype controls + 2 overlay + loading tự chuyển). Các thiết kế ở trang 00–08 được giữ nguyên.

- **Figma prototype:** https://www.figma.com/design/6byZ9bYrWIieH2rx76Dy0S/Fetch-Timer-%E2%80%94-Light-UI?node-id=49-3
- **Figma original:** https://www.figma.com/design/6byZ9bYrWIieH2rx76Dy0S/Fetch-Timer-%E2%80%94-Light-UI?node-id=19-150
- **Word report:** `reports/Fetch_Timer_PRM323_Sketch_Prototype_Report.docx`.
- **HTML runnable prototype:** `prototype/FetchTimer_Prototype.html` (mở trên Chrome / Edge, không cần server).

## Nộp theo Lab 2
- `ux/persona.md`: personas giả định và chỉ số thành công.
- `ux/user-flow.md`: thông tin kiến trúc và 3 flow chuẩn của bản HTML.
- `design/DESIGN.md`: thiết kế token tham khảo, bản Light UI.
- `design/screen-spec.md`: thông số 10 màn HTML, đối chiếu màn Figma.
- `design/design-decisions.md`: UX critique với 7 quyết định.
- `ai/ai-design-log.md`: prompt và 3 lượt refinement tại địa phương. **Không có output Google Stitch thực tế trong bộ tài liệu.**
- `assets/figma/`: ảnh HTML mockup 360/412 px; **không phải ảnh Figma export.**
- `assets/wireframe/`: six low-fidelity wireframe captures.
- `assets/flow/`: 3 sơ đồ.
- `handoff/flutter-handoff.md`: screen notes 6 nhóm + token→Flutter và component→widget.
- `reports/`: bản Word báo cáo hoàn chỉnh.

## Bấm demo trên Figma
1. Mở link Figma prototype, chọn frame `00 · DEMO START — Choose a user flow` rồi nhấn Present.
2. FLOW A: Home → Planner → Create → Conflict → chọn thời gian khác → Detail. Tại Detail, Back→Planner và Home→menu.
3. FLOW B: Home → Focus → Pause/Finish → confirm **overlay** → loading 900 ms → Summary → Insights. Chọn Cancel trong dialog để đóng.
4. FLOW C: Explore → Search → Community → Post → Comment error → Retry → Success message.

**Kiểm tra cấu trúc Figma:** 44 interactive controls; 2 actions OVERLAY; 1 AFTER_TIMEOUT; không có destinationId không tồn tại. Prototype starting point: `Flow 1` trên hub. Cần thao tác demo thực tế trên Figma Presentation trước khi nộp.

## Kiểm thử HTML
3 flow và các trạng thái input validation, dialog cancel, timed loading → summary đã PASS bằng Chromium/Playwright. Ảnh đã chụp ở chiều rộng 360 và 412 px. Bản HTML chỉ mock data và không kết nối backend/Spotify/YouTube hay push notification thật.

## Lưu ý trung thực
User stories từ tệp nguồn; personas được xây dựng giả định. UI Figma gốc do người dùng cung cấp. Báo cáo không khẳng định rằng đã chạy Google Stitch hoặc đã làm khảo sát người dùng. Repo này là bản sẵn sàng upload GitHub, **chưa được publish lên GitHub**. Cần bổ sung ảnh Google Stitch thật và audit WCAG đầy đủ nếu giảng viên yêu cầu bằng chứng từng tiêu chí.
