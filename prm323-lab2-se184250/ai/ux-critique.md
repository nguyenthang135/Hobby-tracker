# Phản biện UI bằng AI — phiên chuẩn bị 11/10/2026

## Prompt nguyên văn của phiên phản biện này

```text
Đánh giá UI Fetch Timer theo 10 usability heuristic của Nielsen, accessibility theo các ngưỡng trong đề PRM323 Lab 2 và proto-persona Minh (21 tuổi, sinh viên, lịch thay đổi, muốn duy trì Guitar/đọc sách). Dùng ảnh Stitch M00–M44, ảnh Figma M01/M02/M07/M08/M10/M16/M18/M31/M34, DESIGN.md và mã Serene_Prototype.html. Nêu ít nhất 5 phát hiện gắn với màn hình cụ thể, bằng chứng, mức ưu tiên, đề xuất sửa và tiêu chí kiểm chứng. Phân biệt quan sát từ ảnh/mã với vấn đề chưa đo. Không bịa nghiên cứu người dùng, prompt lịch sử hoặc vòng cải tiến đã thực hiện. Flow hiện tại: F1 Home → hobby → lịch ngày; F2 Focus; F3 share/tìm/tham gia cộng đồng/thử thách.
```

## Toàn bộ câu trả lời phản biện

Phạm vi đánh giá là ảnh và mã nguồn đã cung cấp, cùng metadata Figma đọc trực tiếp. Không có bài usability test thực tế hoặc kiểm chứng đầy đủ interaction Figma. Những phát hiện dưới đây là phản biện thiết kế, không phải kết quả nghiên cứu người dùng.

| ID | Màn hình / bằng chứng | Phát hiện | Heuristic / tiêu chí | Ưu tiên | Đề xuất và cách kiểm chứng |
|---|---|---|---|---|---|
| C01 | M01, M02, M07–M44; source DESIGN và metadata | Khung hiện 390×844, không phải 360×800 theo đề. HTML còn khóa min-width 390 và body height 844. Scale stage chỉ thu cả điện thoại, không chứng minh reflow | Consistency and standards; responsive | P0 | Dựng frame 360×800 bằng Auto Layout, kiểm tra 412 với nội dung dài. Lưu 2 PNG và frame/node cụ thể |
| C02 | M07/M34; DESIGN nguồn | body-sm 13, label-sm 12, caption 11 dưới yêu cầu đọc tối thiểu 14sp. Không thể khẳng định mọi chữ trong PNG đã đo chính xác | Accessibility, recognition rather than recall | P1 | Nâng token chữ cần đọc lên 14, đo computed style/Figma Inspect. Test chữ tiếng Việt 2 dòng |
| C03 | M07/M34; #8E9E93 trên #F9FAF8 trong prose DESIGN | Chữ phụ nhạt có nguy cơ khó đọc; tỷ lệ màu được tính ở design-decisions.md. Không đánh đồng token nguồn với mọi pixel screenshot | Accessibility; aesthetic and minimalist design | P1 | Dùng onSurfaceVariant cho hướng dẫn/placeholder cần đọc, đo cặp màu thực dùng |
| C04 | M01, M02, M10 và nhiều AppBar | Tiêu đề tiếng Việt nhưng vài label/nhãn nguồn còn tiếng Anh; có màn dùng nhiều tầng tiêu đề và Back/Quay lại cùng lúc | Consistency and standards; match real world | P1 | Một AppBar, một ngôn ngữ, một Back. Điều hướng chính và tên tab giữ nguyên giữa 5 nơi |
| C05 | Figma M18 PNG | Dòng 'Bạn đã hoàn thành phiên...' có chữ chồng nhau ở vùng mô tả dưới tiêu đề. Đây là lỗi nhìn thấy trực tiếp | Aesthetic/minimalist design; accessibility | P0 | Thay layer chồng bằng Text Auto Height, bố trí 2 dòng, kiểm tra 360/412 và text scaling |
| C06 | Stitch M31 so với Figma M31, M34 | Ảnh cover/thumbnails có ở nguồn Stitch nhưng vùng tương ứng Figma trống. Không thể xem đây là cải tiến before/after | Visibility of system status; aesthetic design | P1 | Gắn lại ảnh gốc, thêm fallback loading/error có nhãn, export lại đúng node |
| C07 | M10, child.js | HTML kiểm tra required tên hoạt động nhưng chưa thấy quy tắc đầy đủ ngăn end≤start/trùng giờ ở lớp model chung. Dòng 'không trùng hoạt động nào' có thể là nội dung mẫu | Error prevention; help recover | P0 | Validate ngày, start<end và collision trước lưu; lỗi tại field, giữ input và cho dời giờ. Kiểm tra cả nhánh hợp lệ/sai |
| C08 | M16/M18/M24, child.js/model | Pause/Resume có mã xử lý thời gian, nhưng navigateToSummary đặt remaining=0. Chưa thấy tổng kết lấy duration thực; M18/M24 có số liệu mẫu. Kết thúc sớm có thể bị trình bày như đủ 25 phút | Visibility of system status; user control | P0 | Lưu elapsedActual, tách completed/endedEarly/canceled, một sessionId, test 10 giây rồi finish và so tổng kết |
| C09 | M34/M35/M43 | Public selector có trên UI, nhưng chưa có bằng chứng chính sách nhiều tài khoản hoặc preview chỉ dữ liệu đã chọn | Error prevention; user control | P1 | Trước publish nêu dữ liệu công khai, preview và bản nháp, không chia sẻ lịch/nhật ký. Test quyền riêng tư bằng 2 tài khoản khi có backend |
| C10 | M33/M27/M28/M31/M32 | Nhóm/thử thách có CTA nhưng chưa kiểm chứng kết quả tìm kiếm, trạng thái đã tham gia và chống tham gia lại. HTML có nhánh toggleMembership, không phải backend | Visibility of system status; flexibility | P1 | Search no-result có đổi từ khóa; Join có loading/success/error, đổi CTA và giữ state sau Back |

P0: làm trước khi demo/nộp vì ảnh hưởng flow hoặc vi phạm rõ yêu cầu. P1: làm ở vòng hoàn thiện tiếp theo.

10 heuristic đã được dùng như khung rà soát: visibility of system status; match between system and real world; user control and freedom; consistency and standards; error prevention; recognition rather than recall; flexibility and efficiency; aesthetic and minimalist design; help users recognize/diagnose/recover from errors; help and documentation. C01–C10 gắn các heuristic có vấn đề quan sát được. Không gán một lỗi cho mọi heuristic để đủ số lượng. M44 hướng dẫn là nơi hỗ trợ heuristic Help/documentation; cần người thử xác nhận dễ tìm.

Persona Minh cần thao tác ngắn và phục hồi khi lịch thay đổi, nên ưu tiên lỗi lịch, chữ dễ đọc và thời lượng thực trước khi thêm chức năng. An cần nội dung công khai rõ và bản hobby độc lập. Các bảng thời gian, phần trăm trên screenshot là dữ liệu demo, không phải kết quả sử dụng thật.

Kết luận phản biện: bộ màn bao phủ ba nhu cầu, nhưng hiện chưa đủ bằng chứng toàn bộ rubric. Cần sửa lỗi nhìn thấy, hoàn thiện responsive/wiring/component states và khôi phục lịch sử AI. Chỉ chuyển trạng thái 'đề xuất' thành 'đã làm' khi có ảnh/node/biên bản kiểm tra mới.
