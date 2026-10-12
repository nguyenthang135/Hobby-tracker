# Screen specification — 44 màn hình

Đặc tả dưới đây mô tả **ý đồ đích** để hoàn thiện/triển khai, không khẳng định HTML/Figma hiện đã có mọi trạng thái. M00 là quy chuẩn. M16 có 5 biến thể nhưng chỉ là 1 màn hình. Ảnh nguồn gắn link cho từng màn.

## M01 — Trang chủ

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tổng quan hôm nay, mục tiêu, hobby và nguồn cảm hứng.

**Thao tác và trạng thái đích:** M07 tạo hobby; M02 xem lịch; M03 Focus; M04 cộng đồng; M14 thông báo. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** Home, không Back nội bộ.

**Minh chứng:** [Stitch](../assets/stitch/M01.png) · [Figma](../assets/figma/M01.png).

## M02 — Lịch trình

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Ngày/tuần/tháng, lịch ngày, trạng thái hoạt động.

**Thao tác và trạng thái đích:** Chọn ngày; M12 mở hoạt động; M10 tạo; M13 tìm; M06 danh sách hobby. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M01 hoặc tab Lịch, Back giữ ngày trước.

**Minh chứng:** [Stitch](../assets/stitch/M02.png) · [Figma](../assets/figma/M02.png).

## M03 — Tập trung

**Flow:** F2. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Hobby đang chọn, mode, duration, CTA bắt đầu.

**Thao tác và trạng thái đích:** Chọn hobby; M15 cấu hình; M16 bắt đầu; M17 âm thanh; M24 lịch sử. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** Tab Focus hoặc M08/M12, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M03.png).

## M04 — Cộng đồng

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Feed bài công khai, filter chủ đề và CTA chia sẻ.

**Thao tác và trạng thái đích:** M34 soạn; M35 đọc; M33 tìm; M27 nhóm; M30 thử thách. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** Tab cộng đồng, Back về nguồn nếu mở từ Home.

**Minh chứng:** [Stitch](../assets/stitch/M04.png).

## M05 — Cá nhân

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Hồ sơ, thống kê, sở thích, cài đặt.

**Thao tác và trạng thái đích:** M38 sửa; M39 thành tích; M40 cài đặt; M21 album. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** Tab Cá nhân, không Back nội bộ.

**Minh chứng:** [Stitch](../assets/stitch/M05.png).

## M06 — Danh sách sở thích

**Flow:** F1. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Danh sách hobby, mục tiêu và tiến độ.

**Thao tác và trạng thái đích:** M07 thêm; M08 xem; filter ngày/tiến độ. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M01/M02, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M06.png).

## M07 — Thêm sở thích

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tên, danh mục, icon, màu, mục tiêu, lịch lặp, mẫu gợi ý.

**Thao tác và trạng thái đích:** Tên trim 1–40 ký tự; mục tiêu số dương theo đơn vị; Lưu M08; Hủy xác nhận nếu dirty. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M01/M06 hoặc M35, Back giữ bản nháp theo xác nhận.

**Minh chứng:** [Stitch](../assets/stitch/M07.png) · [Figma](../assets/figma/M07.png).

## M08 — Chi tiết sở thích

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Hobby, tổng giờ, tiến độ 7 ngày và lịch sắp tới.

**Thao tác và trạng thái đích:** M09 sửa; M10 đặt lịch; M15 Focus; M34 chia sẻ. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M06/M07/M35, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M08.png) · [Figma](../assets/figma/M08.png).

## M09 — Chỉnh sửa sở thích

**Flow:** F1. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Form sửa tên, mục tiêu, lịch và thao tác xóa.

**Thao tác và trạng thái đích:** Validation như M07; Lưu M08; Xóa cần confirm, không xóa ngầm lịch sử Focus. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M08, Back xác nhận nếu dirty.

**Minh chứng:** [Stitch](../assets/stitch/M09.png).

## M10 — Tạo hoạt động

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Hobby liên quan, tên, ngày, giờ, lặp, nhắc, ghi chú.

**Thao tác và trạng thái đích:** Tên 1–80; date hợp lệ; end>start; cảnh báo collision; Save M12; lỗi giữ input. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M08/M02, Back về nguồn, dirty confirm.

**Minh chứng:** [Stitch](../assets/stitch/M10.png) · [Figma](../assets/figma/M10.png).

## M11 — Sửa hoạt động

**Flow:** F1. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Hoạt động đã có và form dời lịch.

**Thao tác và trạng thái đích:** Giữ activityId; validation M10; Lưu M12/M02 đúng ngày mới. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M12, Back về M12 khi hủy.

**Minh chứng:** [Stitch](../assets/stitch/M11.png).

## M12 — Chi tiết hoạt động

**Flow:** F1. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tên hoạt động, hobby, ngày/giờ, trạng thái, ghi chú.

**Thao tác và trạng thái đích:** M11 sửa; M15 Focus; hoàn thành có phản hồi; xóa/hoàn tác cần confirm. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M10/M02/M13, Back về ngày nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M12.png).

## M13 — Tìm kiếm lịch

**Flow:** F1. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Từ khóa, bộ lọc loại/ngày/trạng thái, kết quả.

**Thao tác và trạng thái đích:** Filter; xóa bộ lọc; kết quả M12; empty có đổi từ khóa. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M02, Back giữ query/ngày.

**Minh chứng:** [Stitch](../assets/stitch/M13.png).

## M14 — Thông báo

**Flow:** F1. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Nhắc hoạt động, cộng đồng, trạng thái đã đọc.

**Thao tác và trạng thái đích:** M12 mở nhắc lịch; M35 mở bài; M31 mở challenge; retry. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M01/M02, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M14.png).

## M15 — Thiết lập tập trung

**Flow:** F2. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Chọn hobby, mode Pomodoro/countup/custom, thời lượng/nghỉ, tùy chọn âm thanh.

**Thao tác và trạng thái đích:** Duration 1–180 phút theo model nguồn; chọn hobby trước start; M16 bắt đầu; M17 chọn nhạc. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M03/M08/M12, Back giữ cấu hình.

**Minh chứng:** [Stitch](../assets/stitch/M15.png).

## M16 — Phiên tập trung

**Flow:** F2. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tên hobby, timer, phase và Pause/Resume/Finish.

**Thao tác và trạng thái đích:** Ready→Running; Pause giữ elapsed; Resume; Finish overlay; Cancel tiếp tục; Confirm M18. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M15, Back đang chạy phải hỏi tiếp tục/thoát và bảo toàn phiên.

**Minh chứng:** [Stitch](../assets/stitch/M16.png) · [Figma](../assets/figma/M16.png).

## M17 — Âm thanh tập trung

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Nguồn âm thanh thiên nhiên và kết nối nền tảng.

**Thao tác và trạng thái đích:** Chọn/bỏ âm thanh; M41 kết nối tùy chọn; quay lại phiên không reset. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M15/M16, Back về đúng phiên.

**Minh chứng:** [Stitch](../assets/stitch/M17.png).

## M18 — Tổng kết phiên

**Flow:** F2. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tổng kết elapsed thực, trạng thái hoàn thành/sớm, hobby và tâm trạng.

**Thao tác và trạng thái đích:** M19 nhật ký tùy chọn; M24 lịch sử; M01 về Home; không lưu trùng khi Back. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M16, Back về M03/nguồn, không khởi động lại phiên.

**Minh chứng:** [Stitch](../assets/stitch/M18.png) · [Figma](../assets/figma/M18.png).

## M19 — Tạo kỷ niệm

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Tiêu đề, nội dung, ảnh kỷ niệm, hobby/phiên gắn.

**Thao tác và trạng thái đích:** Tiêu đề 1–80; ghi chú ≤2000; ảnh tùy chọn; Lưu M22; bỏ qua vẫn giữ session. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M18/M21, Back confirm nếu dirty.

**Minh chứng:** [Stitch](../assets/stitch/M19.png).

## M20 — Sửa kỷ niệm

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Kỷ niệm đã có, ảnh và nội dung chỉnh sửa.

**Thao tác và trạng thái đích:** Giữ memoryId; validation M19; Lưu M22; xóa cần confirm. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M22, Back giữ bản gốc.

**Minh chứng:** [Stitch](../assets/stitch/M20.png).

## M21 — Album kỷ niệm

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Album, filter hobby, các kỷ niệm.

**Thao tác và trạng thái đích:** M22 mở; M19 tạo; empty có CTA tạo. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M05/M18/M03, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M21.png).

## M22 — Chi tiết kỷ niệm

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Ảnh, ngày, hobby, ghi chú và session liên quan.

**Thao tác và trạng thái đích:** M20 sửa; chia sẻ chỉ nội dung chủ động chọn; không public tự động. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M21/M19, Back về album/nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M22.png).

## M23 — Thống kê tập trung

**Flow:** F2. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Tổng phút, streak, đồ thị và filter thời gian.

**Thao tác và trạng thái đích:** Chọn kỳ/hobby; M24 lịch sử; hiển thị số liệu và nhãn thay chỉ màu. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M03/M08, Back giữ filter.

**Minh chứng:** [Stitch](../assets/stitch/M23.png).

## M24 — Lịch sử tập trung

**Flow:** F2. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Phiên Focus theo ngày, hobby, duration, phase.

**Thao tác và trạng thái đích:** Filter; mở thông tin phiên/tổng kết M18 ở read-only; empty CTA Focus. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M03/M18/M23, Back giữ filter.

**Minh chứng:** [Stitch](../assets/stitch/M24.png).

## M25 — Khám phá kiến thức

**Flow:** F3. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Danh mục và bài kiến thức.

**Thao tác và trạng thái đích:** Filter và M26 đọc; từ khóa không có kết quả có reset. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04, Back về cộng đồng.

**Minh chứng:** [Stitch](../assets/stitch/M25.png).

## M26 — Chi tiết kiến thức

**Flow:** F3. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Nội dung bài, tác giả, ảnh, thông tin liên quan.

**Thao tác và trạng thái đích:** Lưu bài; M25 trở lại; liên kết tới hobby phù hợp. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M25, Back giữ vị trí cuộn.

**Minh chứng:** [Stitch](../assets/stitch/M26.png).

## M27 — Danh sách nhóm

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Các nhóm hobby, tìm/filter và số thành viên.

**Thao tác và trạng thái đích:** M28 chi tiết; M33 tìm; empty đổi filter. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M33, Back giữ query.

**Minh chứng:** [Stitch](../assets/stitch/M27.png).

## M28 — Chi tiết nhóm

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Tên nhóm, mô tả, số thành viên, bài và CTA join.

**Thao tác và trạng thái đích:** Join loading→joined/error; joined CTA không join lại; M29 thảo luận; M30 challenge. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M27/M33, Back giữ trạng thái tham gia.

**Minh chứng:** [Stitch](../assets/stitch/M28.png).

## M29 — Thảo luận

**Flow:** F3. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Nội dung thảo luận, reply và composer.

**Thao tác và trạng thái đích:** Reply trim 1–1000; gửi loading/error giữ nháp; quay về nhóm. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M28, Back giữ thread/scroll.

**Minh chứng:** [Stitch](../assets/stitch/M29.png).

## M30 — Danh sách thử thách

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Thử thách, thời hạn, mức độ, tiến độ tham gia.

**Thao tác và trạng thái đích:** Filter; M31 mở; M32 xem đang tham gia. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M28, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M30.png).

## M31 — Chi tiết thử thách

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Cover, thời hạn, mục tiêu, luật, thành viên và CTA join.

**Thao tác và trạng thái đích:** Join có xác nhận/feedback; deadline hết không join; M32 theo dõi; đã join không duplicate. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M30/M14, Back về danh sách.

**Minh chứng:** [Stitch](../assets/stitch/M31.png) · [Figma](../assets/figma/M31.png).

## M32 — Theo dõi thử thách

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Ngày của challenge, check-in, tiến độ, nhật ký.

**Thao tác và trạng thái đích:** Check-in một lần/ngày theo rule; lỗi giữ trạng thái; M31 luật; mở hobby của tôi nếu liên kết. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M31/M30, Back không mất enrollment.

**Minh chứng:** [Stitch](../assets/stitch/M32.png).

## M33 — Tìm kiếm cộng đồng

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Từ khóa hobby/bài/nhóm, filter và kết quả.

**Thao tác và trạng thái đích:** Nhập query; loading→results; no-result reset; bài M35, nhóm M28, challenge M31. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M27, Back giữ query/scroll.

**Minh chứng:** [Stitch](../assets/stitch/M33.png).

## M34 — Tạo bài chia sẻ

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Hobby liên kết, tác giả, visibility, tiêu đề, nội dung, ảnh, preview.

**Thao tác và trạng thái đích:** Title trim 1–80, content 1–2000; ảnh tối đa 6 theo UI; preview; publish loading→M35/error; giữ nháp. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M08/M22, Back confirm nếu dirty.

**Minh chứng:** [Stitch](../assets/stitch/M34.png) · [Figma](../assets/figma/M34.png).

## M35 — Chi tiết bài đăng

**Flow:** F3. **Phạm vi:** Core demo.

**Mục đích/nội dung:** Bài công khai, tác giả, hobby, ảnh, like/comment/save.

**Thao tác và trạng thái đích:** M36 lưu; thêm hobby M07 giữ thiết lập riêng; comment ≤1000; không sao chép lịch/nhật ký. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M33/M34, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M35.png).

## M36 — Bài đã lưu

**Flow:** F3. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Bài đã lưu, filter, empty state.

**Thao tác và trạng thái đích:** M35 mở; bỏ lưu undo nếu cần; empty CTA khám phá. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M04/M35, Back giữ filter.

**Minh chứng:** [Stitch](../assets/stitch/M36.png).

## M37 — Hồ sơ thành viên

**Flow:** F3. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Hồ sơ công khai thành viên, hobby và bài.

**Thao tác và trạng thái đích:** M35 mở bài; dữ liệu public theo quyền đã chọn. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M35/M28, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M37.png).

## M38 — Sửa hồ sơ

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Avatar, tên, handle và bio.

**Thao tác và trạng thái đích:** Tên 1–40; handle 3–30; bio ≤200; lưu M05; avatar optional. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M05, Back dirty confirm.

**Minh chứng:** [Stitch](../assets/stitch/M38.png).

## M39 — Thành tích

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Danh sách huy hiệu và tiến độ.

**Thao tác và trạng thái đích:** Xem điều kiện; empty khuyến khích hành động; không ép streak khi bỏ ngày. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M05, Back về M05.

**Minh chứng:** [Stitch](../assets/stitch/M39.png).

## M40 — Cài đặt

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Tài khoản, giao diện, notification, privacy và help.

**Thao tác và trạng thái đích:** M41 kết nối; M42 nhắc; M43 riêng tư; M44 help; thao tác destructive confirm. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M05, Back về M05.

**Minh chứng:** [Stitch](../assets/stitch/M40.png).

## M41 — Kết nối nền tảng

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Trạng thái liên kết Spotify/YouTube và dịch vụ.

**Thao tác và trạng thái đích:** Connect/disconnect loading,error; bảo toàn Focus; chỉ mô phỏng nếu chưa OAuth thật. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M40/M17, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M41.png).

## M42 — Cài đặt thông báo

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Lịch nhắc, Focus, cộng đồng, giờ yên lặng.

**Thao tác và trạng thái đích:** Toggle lưu; hệ thống từ chối permission thì hướng dẫn setting; rollback lỗi. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M40, Back giữ cài đặt.

**Minh chứng:** [Stitch](../assets/stitch/M42.png).

## M43 — Quyền riêng tư

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Visibility mặc định, dữ liệu và quyền chia sẻ.

**Thao tác và trạng thái đích:** Đổi private/public có mô tả; không đổi hồi tố bài cũ tự động; confirm thao tác dữ liệu. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M40/M34, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M43.png).

## M44 — Hướng dẫn

**Flow:** F1/F2/F3 hỗ trợ chung. **Phạm vi:** Hỗ trợ/mở rộng.

**Mục đích/nội dung:** Hướng dẫn Home/lịch/Focus/cộng đồng, hỗ trợ.

**Thao tác và trạng thái đích:** Tìm câu hỏi; mở mục trợ giúp; quay flow cũ không mất nháp. Default/populated; loading khi tải/lưu; empty khi không dữ liệu; error có phục hồi nếu áp dụng. Riêng M16: ready/running/paused/completed/endedEarly.

**Điều hướng/Back:** M40/M05, Back về nguồn.

**Minh chứng:** [Stitch](../assets/stitch/M44.png).
