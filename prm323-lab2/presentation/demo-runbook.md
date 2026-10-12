# Demo runbook — 5 phút

## Chuẩn bị

Mở Figma và prototype link thật từ file. Preload 3 starting point; kiểm tra quyền xem; kết nối mạng; mở HTML độc lập làm dự phòng. HTML đi vào màn bằng hash `#M01`, `#M03`, `#M04`; hash là tiện ích kỹ thuật dự phòng, không phải hành trình người dùng. Dữ liệu mẫu: Guitar, 30 phút/ngày, hoạt động Luyện hợp âm F, hôm nay19:00–19:30, Focus25 phút, bài “Một buổi luyện Guitar”, nhóm Guitar, thử thách phù hợp nguồn UI. Không giả định nhóm/challenge Guitar có nếu UI chưa tạo, chọn nhóm/challenge thật có trong prototype.

| Thời điểm | Người | Thao tác | Kết quả mong đợi | Minh chứng |
|---|---|---|---|---|
|0:00–0:25|1|Mở starting point, nêu dữ liệu demo|Home sẵn sàng|Figma06|
|0:25–0:50|2|Home→Thêm hobby, thử thiếu tên|Lỗi có hướng sửa, input giữ|M01/M07|
|0:50–1:20|2|Nhập hobby/mục tiêu, Lưu|Chi tiết hobby mới|M08|
|1:20–1:55|2|Đặt lịch, lưu và về đúng ngày|Hoạt động đúng hobby/ngày/giờ|M10/M12/M02|
|1:55–2:25|3|Chọn hobby, Focus, Pause/Resume|Timer đổi phase, giữ tiến trình|M15/M16|
|2:25–2:45|3|Kết thúc sớm, chọn Tiếp tục|Overlay đóng, quay phiên|M16 overlay|
|2:45–3:05|3|Xác nhận kết thúc, tổng kết|Thời lượng thực, đúng hobby|M18/M24|
|3:05–3:35|4|Soạn, preview, public, publish|Loading→bài đúng nội dung|M34/M35|
|3:35–4:00|4|Tìm nhóm, mở, tham gia|Kết quả đúng, CTA đổi joined|M33/M27/M28|
|4:00–4:25|4|Mở thử thách, join, tiến độ|Enrollment vàprogress rõ|M30/M31/M32|
|4:25–5:00|1|Chỉ starting points, component/token/handoff|Truy vết tới file thật|Figma+repo|

## Các nhánh phải có

F1 alternate: hobby đã có thay vì tạo mới. Error: thiếu tên hoặc giờ sai, sửa được. F2 alternate: bỏ âm thanh, không nhật ký; recovery: hủy kết thúc sớm. F3 alternate: lưu bài/đổi từ khóa khi no-results; recovery: publish/join fail rồi retry, không mất nháp. Toàn bộ Back đúng nguồn, state giữ phù hợp.

## Giới hạn bản HTML đọc từ mã

HTML có localStorage, form required và timer ready/running/paused/completed. Chưa chứng minh lịch ngày cập nhật đầy đủ từ activity mới, filter thật và trạng thái join/challenge bền vững. Model lưu activity nhưng hydrate M12 chỉ thay title, không cập nhật mọi field. Tổng kết M18 và lịch sử M24 còn nội dung mẫu; ending sớm có thể biến remaining về0. Tìm kiếm/join/nhạc là mô phỏng hoặc chưa đủ kiểm chứng backend. Vì vậy không nói HTML đã test full flow đạt. Nếu dùng fallback, nói rõ “đây là bản minh họa chuyển màn/dữ liệu local”.

## Nếu demo gặp sự cố

Dừng thao tác, nêu bước lỗi, mở ảnh/node liên quan, giải thích kết quả đích và phần chưa hoạt động. Dùng menu thư viện HTML để tới màn phục hồi chỉ sau khi đã thông báo. Không bỏ qua lỗi rồi kết luận flow hoàn tất. Không giả mạo loading/overlay bằng ảnh để nhận điểm tương tác.
