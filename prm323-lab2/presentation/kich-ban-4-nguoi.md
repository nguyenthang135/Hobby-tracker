# Kịch bản thuyết trình Fetch Timer cho 4 người

Bám thứ tự mới: F1 Home/hobby/lịch; F2 Focus; F3 cộng đồng. 12 slide, **10 phút trình bày** + **5 phút demo** + **5 phút Q&A** theo DOCX hướng dẫn. Thời lượng là đề xuất, điều chỉnh nếu giảng viên quy định khác.

## Phân vai

| Người | Slide | Thời lượng nói | Demo |
|---|---|---:|---|
| Người 1 | 1–3 | 2 phút 30 giây | Mở đầu, điều phối và thời gian |
| Người 2 | 4–6 | 2 phút 30 giây | F1: Home → hobby → lịch |
| Người 3 | 7–9 | 2 phút 30 giây | F2: Focus |
| Người 4 | 10–12 | 2 phút 30 giây | F3: cộng đồng; kết luận |

**Lịch chính xác của lời đọc dưới đây:** tổng 600 giây. Đọc thử để điều chỉnh tốc độ. Phân vai Người1–4 là vai nói, không thay bằng phân công thực tế đã xảy ra. Cần thay tên trước khi nộp.

## Lời đọc từng slide

### Slide 01 — Fetch Timer (Người 1, 40 giây)

Em xin chào thầy cô. Nhóm chúng em trình bày Fetch Timer, ứng dụng giúp sinh viên duy trì sở thích khi lịch học và sinh hoạt thường xuyên thay đổi. Trong các file giao diện, tên Serene là tên của bộ UI và prototype. Bản trình bày này dùng tên sản phẩm Fetch Timer. Nhóm tập trung ba flow: bắt đầu từ Home để tạo hobby và theo dõi lịch ngày, tạo phiên Focus cho hobby, và chia sẻ, tìm cũng như tham gia cộng đồng và thử thách.

### Slide 02 — Vấn đề và persona (Người 1, 65 giây)

Persona chính là Minh, 21 tuổi, sinh viên muốn luyện Guitar và đọc sách nhưng lịch học thay đổi. Khi công cụ lập lịch, bộ đếm thời gian và nội dung cộng đồng nằm rời rạc, Minh phải tự nối các bước và dễ bỏ dở. Problem statement của nhóm là: sinh viên như Minh cần một cách đơn giản để biến sở thích thành hoạt động có lịch, tập trung thực hiện và thấy tiến bộ. Minh và An trong tài liệu là proto-persona, chưa phải kết quả phỏng vấn. Nhóm đặt mục tiêu đo được: ít nhất 80 phần trăm người thử tạo hobby và lịch hợp lệ trong tối đa ba phút. Đây là tiêu chí để kiểm thử sau, không phải thành tích đã đạt.

### Slide 03 — Kiến trúc thông tin (Người 1, 45 giây)

Cấu trúc điều hướng có năm điểm đến: Trang chủ, Lịch trình, Tập trung, Cộng đồng và Cá nhân. M01 đến M44 là 44 màn hình chức năng, còn M00 chỉ là quy chuẩn. Các trạng thái của timer không được cộng thành màn hình mới. Trong demo, nhóm ưu tiên đường đi trực tiếp đến kết quả. Kiến thức chuyên sâu, album và cài đặt đóng vai trò nhánh hỗ trợ. Mỗi màn đã có đặc tả và mapping flow trong thư mục minh chứng. Sau đây, bạn thứ hai sẽ trình bày ba flow và cách nhóm sử dụng AI.

### Slide 04 — Ba flow chính (Người 2, 55 giây)

Flow một bắt đầu Home. Minh tạo hobby, đặt mục tiêu, tạo hoạt động và xem lại trên lịch ngày. Nhánh thay thế là dùng hobby có sẵn, còn nhánh lỗi giữ dữ liệu và cho sửa tên hoặc giờ. Flow hai chọn hobby, đặt thời lượng, chạy Focus, tạm dừng hoặc tiếp tục rồi xem tổng kết và lịch sử. Kết thúc sớm có xác nhận để tránh mất phiên. Flow ba có các nhánh chia sẻ hobby, tìm cộng đồng phù hợp, tham gia nhóm và tham gia thử thách. Người dùng có thể lưu bài hoặc đổi từ khóa khi không có kết quả. Các sơ đồ chi tiết và đích điều hướng nằm trong user-flow.md.

### Slide 05 — UI sinh từ Google Stitch (Người 2, 40 giây)

Các file xuất từ Stitch cung cấp màn hình cho toàn bộ khu vực chức năng. Gói một và hai có quy chuẩn, Home, hobby và lịch. Gói bốn có Focus và nhật ký. Gói ba có cộng đồng, nhóm và thử thách. Gói năm có cá nhân và cài đặt. Nhóm lưu ảnh gốc và HTML theo mã màn để truy vết. Tuy nhiên, các ZIP là các batch chức năng, không phải năm vòng cải tiến. Đầu vào hiện chưa chứa prompt lịch sử nguyên văn. Prompt mới trong bộ tài liệu được ghi rõ là prompt chuẩn bị cho vòng tiếp theo, không dùng thay cho lịch sử.

### Slide 06 — Phản biện và kế hoạch tinh chỉnh (Người 2, 55 giây)

Phiên phản biện mới rà soát UI theo Nielsen, accessibility và persona, tạo mười phát hiện gắn màn hình cụ thể. Nhóm tổ chức ba mục tiêu tinh chỉnh khác nhau. Vòng một xử lý bố cục 360 và 412, chữ, độ tương phản và vùng chạm. Vòng hai xử lý validation và phục hồi lỗi khi lên lịch. Vòng ba xử lý thời lượng thực của Focus và tổng kết. Ví dụ ảnh Figma M18 có chữ chồng nhau, cần sửa Auto Height. Mã HTML còn tổng kết mẫu nên chưa thể chứng minh kết thúc sớm ghi đúng thời lượng. Ba prompt đã được soạn, nhưng chưa có đủ ảnh sau để coi ba vòng đã hoàn tất. Bạn thứ ba sẽ giải thích các quyết định UI và design system.

### Slide 07 — Quyết định thiết kế (Người 3, 50 giây)

Nhóm chấp nhận năm tab vì Minh cần chuyển nhanh giữa lập lịch và tập trung. Nhật ký và âm thanh là tùy chọn để giảm công việc sau phiên. Nhóm đề xuất sửa token primary và chữ mô tả để dễ đọc, thêm lỗi ngay tại trường nhập và giữ dữ liệu khi lỗi. Với chia sẻ, người dùng cần biết rõ dữ liệu nào công khai và có bản xem trước. Nhóm từ chối mở rộng quá nhiều tính năng social trong năm phút demo vì phạm vi chính là chia sẻ, tìm, tham gia nhóm và thử thách. Tài liệu phân biệt quyết định đích với thay đổi Figma đã chứng minh.

### Slide 08 — Stitch và UI trong Figma (Người 3, 55 giây)

Slide này đối chiếu cùng màn M31 trong nguồn Stitch và Figma. Stitch có ảnh cover, còn Figma đang có vùng trống. Đây là dấu hiệu cần khôi phục ảnh gốc trước khi nộp. Nhóm không gọi hai ảnh này là before và after của một vòng AI vì chưa có lịch sử chứng minh. Tương tự, ảnh Final UI không thay cho wireframe low fidelity. Figma hiện có năm page theo chức năng, trong khi đề yêu cầu sáu page theo quy trình, nên cần sắp xếp lại. Nhóm giữ ảnh xuất thật để thầy cô có thể thấy chính xác trạng thái sản phẩm.

### Slide 09 — Design system và handoff (Người 3, 45 giây)

Design brief chuẩn hóa màu primary là xanh đậm 006A39 và nền F9FAF8. Typography dùng Inter, nội dung và nhãn cần đọc tối thiểu 14sp. Spacing theo các bậc bốn, tám, mười hai, mười sáu và hai mươi bốn. Chín nhóm component phải có Auto Layout, variant và sử dụng token. Metadata cho thấy có symbol và instance, nhưng điều đó chưa chứng minh đầy đủ variant và binding cho chín nhóm. Handoff ghi rõ trạng thái và mapping sang Flutter để người lập trình có hợp đồng đích thống nhất. Bạn thứ tư sẽ trình bày accessibility, demo và bàn giao.

### Slide 10 — Accessibility và responsive (Người 4, 55 giây)

Accessibility cần có phép đo. Cặp chữ trắng trên primary 006A39 có tỷ lệ tương phản khoảng 6.73. Đây là phép tính cặp token, không phải chứng nhận mọi lớp chữ đã đạt. Vùng chạm phải tối thiểu 48dp và nội dung ít nhất 14sp. Nguồn còn token nhỏ hơn mức này nên cần rà soát. Khung đích là 360 nhân 800 và kiểm tra thêm chiều rộng 412, trong khi Figma hiện là 390 nhân 844. Cần kiểm tra reflow bằng Auto Layout, bàn phím, nội dung dài và text scaling, không chỉ thu nhỏ toàn bộ màn hình. Từ 600dp, handoff đề xuất NavigationRail và bố cục phù hợp.

### Slide 11 — Demo ba flow (Người 4, 45 giây)

Demo gồm ba nhiệm vụ và kết quả nhìn thấy rõ. Với flow một, người thao tác bắt đầu Home, tạo hobby và lịch ngày, đồng thời cho thấy một lỗi thiếu tên hoặc giờ để minh họa phục hồi. Flow hai chạy Focus, Pause và Resume, mở xác nhận kết thúc rồi xem tổng kết. Flow ba đăng bài, tìm cộng đồng, tham gia nhóm và thử thách. Khi trình bày, nhóm phải dùng đường bấm bên trong sản phẩm. Thanh chọn màn của HTML chỉ dùng để phục hồi demo nếu cần và phải nói rõ. Figma là minh chứng theo đề, còn HTML là bản dự phòng với dữ liệu mô phỏng.

### Slide 12 — Bàn giao và phần cần hoàn tất (Người 4, 50 giây)

Bộ bàn giao có sáu mục cho mỗi màn: layout, component, state, tương tác, điều hướng và ràng buộc UI. Hai bảng mapping nối token với ColorScheme, TextTheme và hằng số, nối component với widget Flutter. Lab hai không yêu cầu viết code Flutter. Nhóm nộp một repository GitHub và một Figma link có quyền xem. Các phần còn cần hoàn tất là prompt gốc, ba vòng cải tiến có bằng chứng thật, sáu page Figma, kích thước và kiểm chứng prototype. Sau phần trình bày, ba thành viên phụ trách sẽ demo theo thứ tự hobby, Focus và cộng đồng. Nhóm xin nhận câu hỏi sau demo.

## Lời demo và chuyển người

**Người 1 (0:00–0:25):** “Nhóm xin chuyển sang prototype. Chúng em sẽ dùng cùng một hobby minh họa để đi qua ba nhiệm vụ. Các con số trong UI là dữ liệu demo. Phần nào mô phỏng hoặc chưa kiểm chứng, nhóm sẽ nói rõ.”

**Người 2 (0:25–1:55, F1):** “Từ Home em chọn Thêm hobby. Em thử để trống tên để cho thấy lỗi không làm mất các trường đã nhập. Sau đó em tạo Guitar, đặt mục tiêu 30 phút mỗi ngày, chọn Đặt lịch luyện tập, đặt hoạt động Luyện hợp âm vào hôm nay 19:00–19:30. Kết quả cần thấy là hobby và hoạt động đúng trên lịch ngày. Từ chi tiết hoạt động, nút Focus giúp chuyển sang thực hiện. Em chuyển phần đếm thời gian cho bạn thứ ba.”

**Người 3 (1:55–3:05, F2):** “Em chọn hobby và một phiên Pomodoro 25 phút. Khi bắt đầu, trạng thái là Đang tập trung. Em tạm dừng, tiếp tục, rồi mở Kết thúc sớm. Chọn Tiếp tục phải trở về phiên, còn xác nhận kết thúc phải đưa đến tổng kết. Mục tiêu thiết kế là ghi thời lượng thực, không tính Pause. Nếu đang dùng tổng kết mẫu của HTML, đây là màn minh họa chứ chưa chứng minh dữ liệu thời lượng đúng. Tiếp theo bạn thứ tư trình bày cộng đồng.”

**Người 4 (3:05–4:25, F3):** “Em mở Cộng đồng và tạo bài gắn với hobby. Trước khi đăng, em chọn quyền hiển thị và xem trước. Tiếp theo em tìm Guitar, mở nhóm phù hợp và chọn Tham gia. Cuối cùng em mở thử thách, xem quy tắc, tham gia và mở tiến độ. Sau khi join, UI cần đổi trạng thái để người dùng biết đã tham gia. Chúng em chia sẻ nội dung đã chọn, không tự công khai lịch và nhật ký riêng.”

**Người 1 (4:25–5:00):** “Nhóm chỉ ra thêm overlay, transition loading sang kết quả và ba starting point nếu đã hoàn thiện Figma. Sau đó mở nhanh component và file handoff để đối chiếu. Nếu các phần này chưa có, nhóm báo trạng thái còn thiếu, không dùng chuyển màn HTML thay bằng chứng Figma.”

## Gợi ý trả lời Q&A

| Câu hỏi | Lời đáp ngắn |
|---|---|
| Vì sao chọn3 flow? | Chúng giải quyết việc lập kế hoạch, thực hiện và tìm động lực duy trì hobby của Minh. |
| Persona lấy từ đâu? | Proto-persona tổng hợp từ brief và nhu cầu sản phẩm, chưa có phỏng vấn để xác thực. |
| Chỉ số80% là kết quả? | Không, đó là ngưỡng kiểm thử nhóm đề xuất, chưa phải dữ liệu đã thu. |
|5 ZIP có phải5 vòng refine? | Không. Chúng là batch màn hình; vòng refine cần before/after và mục tiêu cụ thể. |
| Tại sao Figma khác Stitch? | Xuất/nhập làm thiếu một số ảnh và có lỗi layer; cần sửa và kiểm tra lại chứ không gọi là cải tiến. |
| Finish sớm lưu bao nhiêu phút? | Handoff yêu cầu thời lượng thực; HTML nguồn còn tổng kết mẫu, cần hoàn thiện trước khi xác nhận. |
| Các dịch vụ nhạc hoạt động thật chưa? | Chưa có bằng chứng OAuth/API thật. UI kết nối là phạm vi mô phỏng hoặc mở rộng. |
| Handoff có gì? |6 mục mỗi màn, mapping token và component, validation và responsive. |

## Điều chỉnh sau khi hoàn thiện sản phẩm

Khi có bằng chứng mới, đổi các câu “cần bổ sung/chưa kiểm chứng” thành mô tả đúng node, ảnh và kết quả thật. Không đọc nguyên câu đã hoàn thành nếu chỉ có đề xuất. Giữ phần thú nhận giới hạn ngắn, tập trung quyết định và minh chứng có thật.
