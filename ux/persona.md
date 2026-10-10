# Persona chính của Hobby Tracker

## Trạng thái và cơ sở xây dựng

Team chọn sinh viên có nhiều sở thích nhưng khó duy trì đều đặn vì lịch học và thời gian rảnh thay đổi làm nhóm người dùng chính của Hobby Tracker.

Hobby Tracker giúp người dùng quản lý sở thích, lên kế hoạch thực hiện, ghi nhận hoạt động và theo dõi tiến bộ theo thời gian. Lịch nhắc và timer hỗ trợ duy trì việc thực hành sở thích.

Minh Anh là persona giả định dùng để định hướng thiết kế, được xây dựng từ các nhu cầu sản phẩm và hướng đã thống nhất với chủ dự án. Những mô tả dưới đây chưa được xác thực qua phỏng vấn hoặc khảo sát. Các tiêu chí thành công là mục tiêu kiểm thử, chưa phải kết quả đã đạt được.

## Hồ sơ

| Thuộc tính | Mô tả |
| --- | --- |
| Tên | Minh Anh |
| Tuổi | 20 |
| Vai trò | Sinh viên năm hai |
| Sở thích đại diện | Đọc sách và tập guitar |
| Thiết bị chính | Điện thoại thông minh |
| Khoảng thời gian rảnh thường gặp trong giả định thiết kế | 15–45 phút giữa các hoạt động |

## Bối cảnh hằng ngày

Minh Anh phải cân đối lịch học, bài tập nhóm và việc cá nhân. Giờ học và thời gian họp nhóm có thể thay đổi, khiến việc dành một khung giờ cố định mỗi ngày cho sở thích khó duy trì.

Minh Anh vẫn muốn đọc sách và tập guitar nhưng thường chỉ có những khoảng rảnh ngắn. Khi có thời gian, Minh Anh cần biết nên thực hiện hoạt động nào, có thể dành bao lâu và bắt đầu mà không phải thiết lập nhiều bước.

## Mục tiêu

- Duy trì việc đọc sách và tập guitar đều đặn mỗi tuần.
- Lên lịch sở thích phù hợp với thời gian học và việc cá nhân.
- Tận dụng các khoảng rảnh ngắn để hoàn thành một phiên hoạt động có mục tiêu.
- Ghi nhận hoạt động đã thực hiện và nhìn lại thời gian dành cho từng sở thích để nhận biết tiến bộ.

## Pain points

- Hay trì hoãn khi hoạt động chưa có lịch hoặc mục tiêu cụ thể.
- Khó chọn thời điểm phù hợp vì thời gian rảnh phân mảnh và lịch sinh hoạt thay đổi.
- Dễ chuyển sang lướt mạng xã hội thay vì bắt đầu hoạt động đã định.
- Khó nhớ đã đọc sách hoặc luyện tập bao nhiêu trong tuần.
- Những bước thiết lập dài khiến việc bắt đầu một phiên ngắn trở nên bất tiện.

## Thói quen dùng thiết bị và nhu cầu accessibility

Minh Anh chủ yếu dùng điện thoại để xem lịch, nhận nhắc nhở và bắt đầu hoạt động. Các tác vụ chính cần thao tác nhanh; thông báo nên vừa đủ, cho phép người dùng kiểm soát để không tạo thêm áp lực.

Chưa có dữ liệu xác định nhu cầu hỗ trợ chuyên biệt của persona. Thiết kế cần bảo đảm chữ dễ đọc, độ tương phản phù hợp, vùng chạm đủ lớn và thông tin không chỉ được truyền đạt bằng màu sắc. Đây là yêu cầu thiết kế để kiểm chứng, không phải kết luận từ nghiên cứu người dùng.

## Tình huống sử dụng đại diện

> Tối nay mình rảnh 25 phút trước giờ họp nhóm. Mình muốn tập guitar, bắt đầu nhanh và lưu lại thời gian đã tập.

Minh Anh mở Hobby Tracker, chọn sở thích guitar và hoạt động muốn thực hiện. Minh Anh có thể dùng timer để hỗ trợ tập trung, sau đó ghi nhận thời gian và kết quả luyện tập vào lịch sử của sở thích. Khi đã biết trước một khoảng rảnh, Minh Anh có thể lên lịch hoạt động và đặt nhắc nhở; khi xem lại lịch sử, Minh Anh biết mình đã duy trì việc tập guitar như thế nào.

## Problem statement

Sinh viên có lịch sinh hoạt thay đổi cần một cách lên kế hoạch, ghi nhận và theo dõi tiến bộ của các sở thích, vì thời gian rảnh phân mảnh, sự xao nhãng và thiếu thông tin về hoạt động đã thực hiện khiến họ khó duy trì đều đặn.

## Tiêu chí thành công dự kiến

| Tác vụ | Mục tiêu | Cách kiểm tra |
| --- | --- | --- |
| Tạo lịch sở thích | Hoàn thành trong tối đa 30 giây | Bắt đầu tại Home với người dùng đã hoàn tất thiết lập ban đầu; đo thời gian đến khi lưu thành công lịch có sở thích, ngày, giờ và thời lượng. |
| Bắt đầu phiên tập trung | Tối đa 3 thao tác từ Home | Với người dùng đã có sở thích, đếm các thao tác chọn hoặc chạm từ Home đến khi timer bắt đầu chạy cho hoạt động và thời lượng mong muốn. |

Khi kiểm thử prototype, ghi thời gian, số thao tác, lỗi và kết quả của từng người thử. Chưa có dữ liệu kiểm thử để khẳng định các mục tiêu này đã đạt được.

## Định hướng cho user flow và thiết kế

- Ưu tiên quản lý sở thích, lên lịch, ghi nhận hoạt động và xem tiến bộ của từng sở thích.
- Timer là công cụ hỗ trợ khi thực hiện hoạt động; kết quả cần gắn với sở thích tương ứng để người dùng theo dõi lại.
- Làm rõ hành động tiếp theo trên Home và giảm công sức thiết lập một phiên ngắn.
- Cho phép người dùng điều chỉnh kế hoạch khi thời gian rảnh thay đổi.
- Thể hiện phản hồi rõ sau thao tác và hỗ trợ phục hồi khi nhập thiếu hoặc gặp lỗi.
- Cộng đồng hỗ trợ tìm cảm hứng và kết nối người cùng sở thích; mức độ ưu tiên thấp hơn quản lý và theo dõi sở thích trong phạm vi thiết kế ban đầu.
