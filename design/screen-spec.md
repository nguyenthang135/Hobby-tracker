# Đặc tả màn hình Hobby Tracker

## 1. Mục đích và phạm vi

Tài liệu mô tả nội dung và cách sử dụng 12 màn hình của Hobby Tracker để nhóm chuẩn bị prompt Stitch, wireframe và UI trong Figma. Người dùng chính là Minh Anh, sinh viên 20 tuổi muốn duy trì việc đọc sách và tập guitar trong những khoảng rảnh ngắn.

Danh sách màn hình và điều hướng dựa trên [user-flow.md](../ux/user-flow.md); mục tiêu sử dụng dựa trên [persona.md](../ux/persona.md). Các yêu cầu chung về trạng thái, accessibility và prototype được đối chiếu với tài liệu Lab 2 và hướng dẫn trình bày đi kèm. Những ví dụ dưới đây là dữ liệu giả định dùng cho thiết kế.

Ba flow được giữ nguyên:

- **F01:** quản lý sở thích và lên lịch hoạt động.
- **F02:** thực hiện, ghi nhận hoạt động và xem tiến bộ.
- **F03:** khám phá cộng đồng và tham gia nhóm sở thích.

Màu sắc, font, spacing, bo góc và elevation sẽ được thống nhất trong [DESIGN.md](DESIGN.md). Khi dựng Figma, dùng Variables hoặc styles và component tái sử dụng để các màn hình nhất quán. Tài liệu này chưa ấn định các giá trị thiết kế đó.

## 2. Quy tắc chung khi thiết kế

- Đặt tên frame theo mã và tên màn hình, ví dụ `S06 — Tạo hoặc sửa lịch hoạt động`. Giữ nguyên mã S01–S12 trong prompt, wireframe, Final UI và prototype.
- Dùng tiếng Việt cho nhãn, thông báo và nút bấm. Thông báo cần nói rõ điều gì đang xảy ra và người dùng có thể làm gì tiếp theo.
- Mỗi màn hình có một hành động chính nổi bật. Các thao tác phụ vẫn dễ tìm nhưng không cạnh tranh về mức độ nhấn mạnh.
- Bốn màn cấp cao nhất S01, S02, S05, S11 dùng thanh điều hướng **Trang chủ – Sở thích – Lịch – Cộng đồng**. Màn con có tiêu đề và nút Quay lại. Ở timer và form nhập liệu, ưu tiên không gian cho tác vụ đang làm.
- Nội dung dài được cuộn; nút quan trọng không bị che bởi bàn phím hoặc vùng an toàn của thiết bị. Giữ nhãn trường nhập, cho phép tên dài xuống dòng ở màn chi tiết và rút gọn có chủ đích trong danh sách.
- Khung chính là **360 × 800 dp**, kiểm tra thêm chiều rộng **412 dp** bằng Auto Layout và constraints. Vùng chạm tối thiểu **48 × 48 dp**, chữ nội dung tối thiểu **14 sp**. Contrast tối thiểu **4.5:1** cho chữ thường và **3:1** cho chữ lớn, các điều khiển UI theo yêu cầu Lab 2.
- Thông báo lỗi, lựa chọn và trạng thái cần có chữ hoặc biểu tượng, không chỉ dùng màu. Nếu có biểu đồ, luôn kèm số liệu và nhãn dễ đọc.
- Loading, empty, error, dialog và các chế độ thêm/sửa là trạng thái của màn hình tương ứng, không tính thêm vào 12 màn hình. Chỉ dựng trạng thái phù hợp với tác vụ, không cần gán mọi loại trạng thái cho mọi màn hình.
- Form lỗi giữ dữ liệu đã nhập. Khi đang lưu hoặc tham gia nhóm, khóa thao tác gửi để tránh bấm lặp. Chỉ cập nhật dữ liệu sau khi thao tác thành công.
- Nút Back giữ ngữ cảnh theo `user-flow.md`. Khi rời form đã thay đổi nhưng chưa lưu, hỏi người dùng muốn tiếp tục hay bỏ thay đổi. Riêng S09 giữ bản nháp khi quay lại timer hoặc chi tiết sở thích.
- Đối với màn rộng từ **600 dp**, hướng thích ứng sẽ được mô tả trong `handoff/flutter-handoff.md`; Lab 2 không yêu cầu vẽ thêm một bộ màn hình riêng cho kích thước này.

## 3. Dữ liệu mẫu dùng chung

Nhóm dùng các dữ liệu sau để nội dung giữa các màn hình khớp nhau. “Hôm nay” là ngày được chọn để demo; các hoạt động trong phần thống kê đều thuộc tuần demo. Khi nhập ngày cụ thể vào Figma, cần chọn ngày phù hợp để nhánh tạo lịch tương lai và ghi nhận hoạt động đã làm không mâu thuẫn nhau.

| Nội dung | Dữ liệu mẫu |
| --- | --- |
| Người dùng | Minh Anh |
| Sở thích Guitar | Mục tiêu 120 phút/tuần; đã ghi nhận 3 buổi, mỗi buổi 25 phút; tổng 75 phút |
| Sở thích Đọc sách | Mục tiêu 90 phút/tuần; đã ghi nhận 1 buổi 20 phút |
| Tổng quan trước khi lưu buổi tập mới | 2 sở thích, 4 hoạt động đã ghi nhận, tổng 95 phút |
| Lịch sắp tới | Guitar — “Luyện chuyển hợp âm”, hôm nay lúc 19:00, thời lượng 25 phút; lời nhắc trước 10 phút nếu được bật và có quyền |
| Lịch dùng cho nhánh cảnh báo | Một hoạt động Guitar khác từ 19:10 đến 19:40, giao với lịch 19:00–19:25; chỉ xuất hiện trong biến thể kiểm tra lịch giao nhau |
| Hoạt động mới cần ghi nhận | Guitar — “Luyện chuyển hợp âm”, 25 phút thực tế; ghi chú “Chuyển hợp âm Am–C–G đều hơn”; ảnh là tùy chọn |
| Tiến bộ sau khi lưu thành công | Guitar: 4 buổi, 100/120 phút trong tuần; tổng hai sở thích: 5 hoạt động, 120 phút |
| Nhóm cộng đồng | “Guitar cho người mới”; mô tả nhóm luyện tập cơ bản; quy tắc trao đổi lịch sự, chia sẻ đúng chủ đề |
| Nội dung truyền cảm hứng | “Dành 15 phút hôm nay để luyện chuyển giữa hai hợp âm” |

Tạo lịch mới chỉ làm thay đổi lịch hoạt động. Tổng thời gian và số buổi chỉ tăng sau khi ghi nhận thành công ở S09. Các số liệu trên mô tả trước và sau **một lần lưu**, không cộng tiếp mỗi khi mở lại màn hình hoặc thử lại thao tác.

## 4. Yêu cầu từng màn hình

### S01 — Trang chủ

**Mục đích:** giúp Minh Anh biết sắp tới mình có hoạt động gì và chọn việc muốn làm tiếp mà không phải tìm qua nhiều màn hình.

**Nội dung hiển thị:**

- Lời chào “Chào Minh Anh” và ngày đang xem.
- Thẻ hoạt động sắp tới: “Luyện chuyển hợp âm”, Guitar, 19:00, 25 phút.
- Các sở thích gần đây và tổng quan tuần: 2 sở thích, 4 hoạt động, 95 phút trước khi ghi nhận buổi tập mới.
- Lối vào tiến bộ của từng sở thích và thanh điều hướng chính.

**Hành động chính:** “Tạo lịch” → S06. Nếu chưa có sở thích, thay bằng “Thêm sở thích” → S02 → S03.

**Hành động phụ:** chọn hoạt động sắp tới → S07; chọn sở thích → S04; chọn tiến bộ của sở thích → S10; đổi điểm đến trên thanh điều hướng.

**Trạng thái cần dựng:** có dữ liệu; chưa có sở thích; đã có sở thích nhưng chưa có lịch sắp tới; đang tải tổng quan; lỗi tải kèm “Thử lại”. Nếu chưa có lịch, vẫn hiển thị sở thích và tiến bộ đã có.

**Điều hướng và flow:** là điểm bắt đầu của F01, F02, F03. Là màn cấp cao nhất, không đặt nút Back dẫn sang một màn khác trong ứng dụng. Khi về lại Trang chủ sau khi lưu, cập nhật dữ liệu tương ứng.

**Lưu ý:** trạng thái rỗng cần hướng người dùng đến bước đầu tiên phù hợp. Tránh để thẻ thống kê lấn át hành động chính hoặc khiến việc mở sở thích gần đây khó tìm.

### S02 — Sở thích của tôi

**Mục đích:** xem những sở thích đang theo đuổi, mở một sở thích hoặc thêm sở thích mới.

**Nội dung hiển thị:** tiêu đề, danh sách Guitar và Đọc sách; mỗi thẻ có tên, biểu tượng và thời gian đã thực hiện trong tuần. Nếu có mục tiêu, hiển thị dưới dạng “75/120 phút”; nếu chưa có, chỉ hiển thị thời gian đã thực hiện.

**Hành động chính:** “Thêm sở thích” → S03.

**Hành động phụ:** chọn thẻ sở thích → S04; chuyển màn bằng thanh điều hướng chính.

**Trạng thái cần dựng:** có danh sách; danh sách rỗng với nội dung “Bạn chưa thêm sở thích nào” và nút “Thêm sở thích”; đang tải; lỗi tải và “Thử lại”.

**Điều hướng và flow:** thuộc F01. Mở từ S01 hoặc thanh điều hướng. Đây là màn cấp cao nhất. Sau khi thêm sở thích rồi quay lại từ S04, danh sách cần có sở thích vừa tạo.

**Lưu ý:** toàn bộ thẻ có thể bấm, không chỉ riêng biểu tượng. Tên dài không được che thông tin tiến bộ hoặc làm vùng chạm quá nhỏ.

### S03 — Thêm hoặc sửa sở thích

**Mục đích:** tạo một sở thích cá nhân hoặc chỉnh lại thông tin và mục tiêu của sở thích đã có.

**Nội dung hiển thị:** tiêu đề theo chế độ thêm/sửa; ô tên sở thích bắt buộc; lựa chọn biểu tượng tùy chọn; mục tiêu số phút mỗi tuần tùy chọn. Ghi rõ mục tiêu có thể để trống.

**Hành động chính:** “Lưu sở thích”. Thêm mới thành công → S04 của sở thích vừa tạo; sửa thành công → S04 đang xem.

**Hành động phụ:** Quay lại hoặc Hủy; chọn “Dùng sở thích đã có” khi tên bị trùng → S04 tương ứng.

**Trạng thái cần dựng:** form mới; form đã nhập; form sửa được điền sẵn; lỗi tên trống; lỗi tên trùng; lỗi mục tiêu không hợp lệ; đang lưu; lưu thất bại với “Thử lại”; hộp thoại bỏ thay đổi chưa lưu.

**Điều hướng và flow:** thuộc F01. Thêm mới từ S02, sửa từ S04. Hủy trở về nơi đã mở form. Khi rời form có thay đổi, phải xác nhận trước khi bỏ.

**Quy tắc:** bỏ khoảng trắng thừa ở đầu/cuối tên trước khi kiểm tra trống và trùng. Khi sửa, không coi tên hiện tại của chính sở thích đó là trùng. Nếu nhập mục tiêu tuần, phải là số phút lớn hơn 0. Thông báo gợi ý: “Nhập tên sở thích”, “Bạn đã có sở thích này”, “Mục tiêu cần lớn hơn 0 phút”. Lưu lỗi giữ nguyên form; lưu thành công cập nhật tên/mục tiêu ở các màn liên quan.

### S04 — Chi tiết sở thích

**Mục đích:** tập hợp thông tin của một sở thích để Minh Anh dễ bắt đầu, ghi lại hoạt động hoặc xem mình đã duy trì ra sao.

**Nội dung hiển thị:** tên Guitar và biểu tượng; mục tiêu 120 phút/tuần nếu đã đặt; tiến độ 75/120 phút; các hoạt động gần đây với ngày, thời gian và ghi chú; ảnh khoảnh khắc nếu có. Có lối mở lịch và xem tiến bộ chi tiết.

**Hành động chính:** “Bắt đầu hoạt động” → S08 ở chế độ chọn thời lượng.

**Hành động phụ:** “Ghi nhận hoạt động” → S09 thủ công; “Lên lịch” → S05 đã lọc theo sở thích; “Xem tiến bộ” → S10; “Sửa sở thích” → S03.

**Trạng thái cần dựng:** có lịch sử; chưa có hoạt động với gợi ý bắt đầu hoặc ghi nhận; chưa đặt mục tiêu; đang tải; lỗi tải và “Thử lại”.

**Điều hướng và flow:** thuộc F01 và F02. Mở từ S02 hoặc S01; Back về nơi đã mở. Sau khi thêm mới ở S03, Back từ S04 về S02. Khi quay về từ S10 sau khi lưu, lịch sử phải có hoạt động vừa ghi nhận.

**Lưu ý:** luôn ghi rõ tên sở thích ở đầu màn. Việc mở S04 chỉ để xem không làm timer chạy. Khi chưa đặt mục tiêu, không tự tạo phần trăm hoàn thành.

### S05 — Lịch hoạt động

**Mục đích:** giúp Minh Anh xem thời gian đã dự định cho sở thích và tìm một khoảng phù hợp để lên lịch thêm.

**Nội dung hiển thị:** ngày đang xem, bộ chọn ngày, bộ lọc sở thích và danh sách/timeline hoạt động. Mỗi hoạt động có tên, sở thích, giờ bắt đầu và thời lượng. Ví dụ: Guitar — “Luyện chuyển hợp âm”, 19:00–19:25.

**Hành động chính:** “Tạo lịch” → S06.

**Hành động phụ:** đổi ngày; chọn hoặc xóa bộ lọc; mở hoạt động → S07; chuyển điểm đến trên thanh điều hướng chính.

**Trạng thái cần dựng:** có lịch; ngày chưa có hoạt động; bộ lọc không có kết quả; đang tải; lỗi tải và “Thử lại”. Trạng thái rỗng vẫn cho đổi ngày, bỏ lọc hoặc tạo lịch.

**Điều hướng và flow:** thuộc F01. Mở qua thanh điều hướng hoặc từ S04. Khi mở từ S04, chọn sẵn bộ lọc sở thích tương ứng. S05 là màn cấp cao nhất; người dùng trở về S01 qua thanh điều hướng. Khi quay lại từ S07, giữ ngày và bộ lọc đang xem.

**Lưu ý:** khi mở S06, điền sẵn ngày đã chọn và sở thích đang lọc nếu có. Phân biệt ngày đang chọn bằng nhãn/trạng thái rõ ràng, không chỉ bằng màu.

### S06 — Tạo hoặc sửa lịch hoạt động

**Mục đích:** lên lịch một hoạt động sở thích hoặc điều chỉnh lịch đã có cho phù hợp thời gian rảnh.

**Nội dung hiển thị:** sở thích, tên hoạt động, ngày, giờ bắt đầu, thời lượng và tùy chọn lời nhắc. Ví dụ: Guitar — “Luyện chuyển hợp âm”, hôm nay 19:00, 25 phút. Lời nhắc mặc định tắt; khi bật có lựa chọn “Trước 10 phút” trong dữ liệu demo.

**Hành động chính:** “Lưu lịch” → S07 khi thành công.

**Hành động phụ:** Quay lại hoặc Hủy; thay đổi sở thích/ngày/giờ; tắt lời nhắc; chọn đổi giờ hoặc giữ lịch trong cảnh báo giao nhau.

**Trạng thái cần dựng:** form mới; form có dữ liệu; form sửa được điền sẵn; lỗi nhập liệu; cảnh báo lịch giao nhau; quyền thông báo chưa được cấp hoặc bị từ chối; đang lưu; lưu thất bại; hộp thoại bỏ thay đổi chưa lưu.

**Điều hướng và flow:** thuộc F01. Mở từ S01 để tạo nhanh, từ S05 để tạo theo ngày/bộ lọc, hoặc từ S07 để sửa. Lưu xong thay form bằng S07. Back từ S07 về S01 hoặc S05 tùy nơi bắt đầu; nếu sửa, trở về S07 hiện có.

**Quy tắc:** bắt buộc chọn sở thích, nhập tên hoạt động, ngày, giờ và thời lượng lớn hơn 0; lịch mới không được ở quá khứ. Khi sửa lịch, không so trùng với chính lịch đang sửa. Nếu giờ giao nhau với hoạt động khác, cảnh báo và cho “Đổi giờ” hoặc “Vẫn giữ lịch”. Lưu lỗi giữ toàn bộ thông tin.

Chỉ xin quyền thông báo khi người dùng bật lời nhắc. Nếu từ chối, giải thích “Bạn vẫn có thể lưu lịch mà không có lời nhắc” và cho chọn lưu không nhắc hoặc quay lại chỉnh. Khi lưu không nhắc, S07 phải hiển thị lời nhắc đang tắt. Với lịch cũ đã qua giờ, nếu chỉ sửa tên hoặc lời nhắc thì không bắt người dùng đổi ngày; nếu đổi thời điểm bắt đầu thì áp dụng quy tắc thời điểm mới không ở quá khứ. Đây là cách xử lý đề xuất cho chế độ sửa để không cản các thay đổi không liên quan.

### S07 — Chi tiết hoạt động đã lên lịch

**Mục đích:** kiểm tra thông tin lịch và bắt đầu thực hiện hoạt động đã chọn.

**Nội dung hiển thị:** tên “Luyện chuyển hợp âm”, sở thích Guitar, ngày, giờ 19:00, thời lượng 25 phút và trạng thái lời nhắc. Sau khi lưu lịch, hiển thị phản hồi “Đã lưu lịch”.

**Hành động chính:** “Bắt đầu hoạt động” → S08 đang chạy với thời lượng đã lưu.

**Hành động phụ:** “Sửa lịch” → S06; Quay lại. Với hoạt động đã có bản ghi hoàn thành, cho mở tiến bộ của sở thích ở S10 để xem kết quả.

**Trạng thái cần dựng:** có thông tin lịch; vừa lưu thành công; lời nhắc bật/tắt; hoạt động đã ghi nhận; đang tải; lỗi tải với “Thử lại”.

**Điều hướng và flow:** thuộc F01 và F02. Mở từ S01, S05 hoặc sau khi lưu ở S06. Back về S01 hoặc S05 theo ngữ cảnh ban đầu. Sửa xong vẫn xem đúng hoạt động đó.

**Lưu ý:** lịch chưa được tính là một buổi đã thực hiện. Nhấn Bắt đầu là thao tác chủ động chạy timer; chỉ mở S07 không tự chạy. Với lịch đã hoàn thành, hiển thị “Đã ghi nhận” và ưu tiên “Xem tiến bộ”, không coi việc xem lại là thực hiện thêm một lần.

### S08 — Thực hiện hoạt động

**Mục đích:** hỗ trợ Minh Anh dành một khoảng thời gian cho sở thích, có thể tạm dừng và ghi nhận phần đã làm.

**Nội dung hiển thị:** tên sở thích, tên hoạt động nếu có, thời lượng dự kiến, thời gian còn lại và thời gian đã thực hiện. Nếu mở từ S04, cho chọn nhanh 15/25/45 phút ngay trên màn này. Nếu mở bằng nút Bắt đầu ở S07, dùng thời lượng đã lưu và chạy ngay.

**Hành động chính theo trạng thái:** chọn một thời lượng để bắt đầu khi mở từ S04; “Tạm dừng” khi đang chạy; “Tiếp tục” khi tạm dừng; “Ghi nhận hoạt động” khi hoàn thành.

**Hành động phụ:** “Kết thúc” hoặc Back để mở hộp thoại overlay. Người dùng có thể tiếp tục, chuyển sang S09 để ghi nhận thời gian đã thực hiện, hoặc xác nhận bỏ phiên.

**Trạng thái cần dựng:** chọn thời lượng; đang chạy; tạm dừng; hoàn thành; overlay kết thúc; xác nhận bỏ phiên. Hết thời gian chuyển sang S09; có thể dùng một trạng thái hoàn thành ngắn để người dùng hiểu điều vừa xảy ra.

**Điều hướng và flow:** thuộc F02. Mở từ S04 hoặc S07. Kết thúc có ghi nhận → S09. Bỏ phiên đã xác nhận → đúng S04 hoặc S07 ban đầu, không thêm bản ghi. Hủy overlay giữ màn timer và thời gian đã thực hiện.

**Lưu ý:** đóng hộp thoại bằng “Tiếp tục hoạt động” trở lại timer đang chạy như sơ đồ F02. Thời gian tạm dừng không được cộng vào thời gian thực hiện. Từ S09 quay lại, giữ thời gian đã thực hiện; nếu timer đã hết giờ, cho mở lại ghi nhận thay vì chạy lại từ đầu. Phiên 0 phút chưa thể lưu thành hoạt động; S09 cần hướng dẫn tiếp tục hoạt động hoặc sửa số phút thực tế.

Đường bắt đầu từ S01 → S07 → Bắt đầu cần 2 thao tác. Đường S01 → S04 → Bắt đầu → chọn thời lượng cần tối đa 3 thao tác. Không thêm một màn thiết lập riêng hoặc một nút xác nhận sau khi chọn thời lượng làm tăng số thao tác này.

### S09 — Ghi nhận hoạt động

**Mục đích:** lưu lại hoạt động đã làm, thời gian thực tế và khoảnh khắc muốn nhớ của một sở thích.

**Nội dung hiển thị:** sở thích bắt buộc, ngày thực hiện, số phút thực tế, ghi chú tùy chọn và khu vực thêm ảnh tùy chọn. Hiển thị tên hoạt động nếu đi từ timer/lịch; ví dụ buổi tập Guitar 25 phút với ghi chú “Chuyển hợp âm Am–C–G đều hơn”.

**Hành động chính:** “Lưu hoạt động” → loading ngay trên S09 → S10 khi thành công.

**Hành động phụ:** sửa số phút hoặc ghi chú; chọn/chụp ảnh, xem trước và bỏ ảnh; Quay lại. Không yêu cầu ảnh hay ghi chú để lưu.

**Trạng thái cần dựng:** form thủ công; form điền sẵn từ timer; có/không có ảnh; quyền ảnh/camera bị từ chối; lỗi nhập liệu; đang lưu với nút Lưu bị khóa; lỗi lưu có “Thử lại” và “Chỉnh sửa”.

**Điều hướng và flow:** thuộc F02. Mở từ S08 hoặc S04 khi ghi nhận thủ công. Back giữ bản nháp và về S08 đang tạm dừng hoặc S04 theo nguồn mở. Lưu thành công kết thúc phiên, thay phần nhập/timer bằng S10 của sở thích đó; Back từ S10 về S04.

**Quy tắc:** phải có sở thích, số phút thực tế lớn hơn 0 và ngày thực hiện không ở tương lai. Mở từ timer thì điền sẵn thời gian thực tế, không dùng mặc định thời lượng dự kiến nếu kết thúc sớm. Người dùng vẫn sửa được thời gian khi cần. Lỗi gợi ý: “Nhập thời gian đã thực hiện, lớn hơn 0 phút”, “Ngày thực hiện không được ở tương lai”.

Chỉ xin quyền ảnh hoặc camera khi người dùng chọn hành động cần quyền đó. Nếu từ chối hoặc hủy chọn ảnh, giữ nội dung và tiếp tục không ảnh. Khi lưu thất bại, giữ form và ảnh, hiển thị “Chưa lưu được hoạt động. Bạn có thể thử lại.” Không cập nhật tiến bộ hoặc cộng trùng buổi tập do bấm lặp.

### S10 — Tiến bộ của sở thích

**Mục đích:** giúp Minh Anh nhìn lại mức độ duy trì sở thích và những hoạt động đã hoàn thành.

**Nội dung hiển thị:** tên sở thích, khoảng thời gian thống kê là tuần đang xem, tổng phút, số buổi và lịch sử gần đây. Nếu có mục tiêu, hiển thị tiến độ kèm số liệu. Sau khi lưu buổi Guitar mới, hiển thị 4 buổi và 100/120 phút; có phản hồi “Đã lưu hoạt động”.

**Hành động chính:** “Về sở thích” → S04.

**Hành động phụ:** xem lại danh sách hoạt động và nội dung ghi chú/ảnh đã lưu. Không yêu cầu thêm màn chi tiết bản ghi trong bộ 12 màn hình này.

**Trạng thái cần dựng:** có dữ liệu; vừa lưu thành công; chưa có hoạt động; chưa đặt mục tiêu; đang tải; lỗi tải và “Thử lại”. Nếu chưa có dữ liệu, hiển thị 0 phút/0 buổi cùng gợi ý về S04 để bắt đầu hoặc ghi nhận.

**Điều hướng và flow:** thuộc F02. Mở từ S04, S01 sau khi chọn tiến bộ của một sở thích, hoặc S09 sau khi lưu. Nếu mở trực tiếp từ S01 thì Back về S01; nếu từ S04 hoặc sau khi lưu thì Back về S04. Nút “Về sở thích” luôn mở S04 tương ứng.

**Quy tắc:** chỉ thống kê bản ghi đã lưu thuộc sở thích và tuần đang xem. Lịch tương lai và phiên chưa lưu không được cộng vào tiến bộ. Khi chưa có mục tiêu, bỏ thanh/phần trăm hoàn thành nhưng vẫn hiển thị tổng phút và số buổi. Mọi biểu đồ cần có nhãn và số liệu, không dùng màu làm dấu hiệu duy nhất.

### S11 — Khám phá cộng đồng

**Mục đích:** tìm một nhóm phù hợp để có thêm cảm hứng và kết nối với người cùng sở thích.

**Nội dung hiển thị:** ô tìm kiếm, bộ lọc sở thích và danh sách nhóm gợi ý hoặc kết quả. Mỗi thẻ có tên, sở thích liên quan, mô tả ngắn và nhãn Đã tham gia nếu phù hợp. Dữ liệu mẫu gồm nhóm “Guitar cho người mới”.

**Hành động chính:** chọn một nhóm để xem → S12. Không đặt nút tham gia ngay trong danh sách khiến người dùng bỏ qua thông tin và quy tắc nhóm.

**Hành động phụ:** nhập hoặc xóa từ khóa, đổi hoặc xóa bộ lọc, chuyển màn qua thanh điều hướng chính.

**Trạng thái cần dựng:** danh sách gợi ý; kết quả tìm kiếm; không có kết quả; đang tải; lỗi tải với “Thử lại”. Khi không tìm thấy, hiển thị “Chưa tìm thấy nhóm phù hợp” và cho đổi từ khóa hoặc xóa bộ lọc.

**Điều hướng và flow:** thuộc F03. Mở từ S01 hoặc thanh điều hướng. Mở nhóm → S12; quay lại giữ từ khóa, bộ lọc và vị trí danh sách. S11 là màn cấp cao nhất; về S01 qua thanh điều hướng.

**Lưu ý:** phân biệt không có kết quả với lỗi tải danh sách. Không làm mất từ khóa khi thử tải lại. Không thêm chat, tạo nhóm hay đăng bài vào màn hình này.

### S12 — Chi tiết nhóm sở thích

**Mục đích:** giúp Minh Anh hiểu nhóm chia sẻ về điều gì, có phù hợp không rồi quyết định tham gia.

**Nội dung hiển thị:** tên “Guitar cho người mới”, sở thích liên quan, mô tả, quy tắc và nội dung mẫu “Dành 15 phút hôm nay để luyện chuyển giữa hai hợp âm”. Hiển thị rõ trạng thái thành viên.

**Hành động chính:** “Tham gia nhóm” khi chưa tham gia → overlay xác nhận. Khi đã tham gia, thay bằng trạng thái “Đã tham gia” rõ ràng và cho tiếp tục đọc nội dung, không tiếp tục mời tham gia.

**Hành động phụ:** Quay lại; đọc nội dung; chọn Hủy hoặc xác nhận trong overlay. Hủy chỉ đóng hộp thoại, không đổi trạng thái thành viên.

**Trạng thái cần dựng:** chưa tham gia; đã tham gia; overlay xác nhận; đang tham gia với nút bị khóa; tham gia thất bại có “Thử lại”; đang tải chi tiết; lỗi tải chi tiết và “Thử lại”.

**Điều hướng và flow:** thuộc F03. Mở từ S11; Back trở về S11 với từ khóa/bộ lọc cũ. Xác nhận tham gia thành công giữ S12 và cập nhật trạng thái. Khi tham gia thất bại, giữ thông tin nhóm và trạng thái chưa tham gia; cho thử lại hoặc quay về S11.

**Lưu ý:** nội dung mẫu được phép xem trước khi tham gia theo giả định đã ghi trong user flow. Không thêm nút chat, đăng bài hoặc rời nhóm ở phạm vi này. Prototype mô phỏng kết quả tham gia, chưa phải kết nối cộng đồng thực tế.

## 5. Hộp thoại và trạng thái dùng trong prototype

Các mục dưới đây thuộc màn hình đã liệt kê, không tạo thêm mã màn hình mới.

| Hộp thoại hoặc trạng thái | Nơi sử dụng | Nội dung và thao tác |
| --- | --- | --- |
| Bỏ thay đổi chưa lưu | S03, S06 | “Bạn có muốn bỏ các thay đổi chưa lưu?”; “Tiếp tục chỉnh sửa” đóng hộp thoại, “Bỏ thay đổi” về màn trước |
| Cảnh báo lịch giao nhau | S06 | Nêu hoạt động và khoảng giờ đang giao nhau; “Đổi giờ” về form giữ dữ liệu, “Vẫn giữ lịch” tiếp tục lưu |
| Kết thúc hoạt động | S08 | Nêu thời gian đã thực hiện; “Tiếp tục hoạt động”, “Ghi nhận thời gian” hoặc “Bỏ phiên”; bỏ phiên cần xác nhận trước khi mất tiến trình |
| Xác nhận tham gia | S12 | “Tham gia nhóm Guitar cho người mới?”; “Hủy” đóng overlay, “Tham gia” chuyển sang trạng thái đang xử lý |
| Đang lưu → kết quả | S09 → S10 | Spinner và “Đang lưu hoạt động…”; khóa nút Lưu; thành công mở S10 với số liệu mới, thất bại giữ S09 và cho thử lại |

Hộp thoại dùng overlay để vẫn nhìn thấy màn nền. Chỉ hành động xác nhận mới lưu hoặc bỏ dữ liệu; nhấn Hủy/Back trên hộp thoại không được tự thực hiện hành động đó. Giao diện xin quyền ảnh, camera hoặc thông báo là giao diện hệ điều hành; trong prototype cần thể hiện cả kết quả cho phép và từ chối, không tính thành màn hình ứng dụng.

## 6. Component và bằng chứng cần chuẩn bị

Khi dựng Figma, các màn hình sử dụng instance của thư viện component. Chín nhóm bắt buộc theo Lab 2 được áp dụng như sau:

| Nhóm component | Ví dụ sử dụng | Trạng thái cần có trong thư viện |
| --- | --- | --- |
| Button | Lưu lịch, Lưu hoạt động, Tham gia | Default, pressed, disabled, loading |
| Text field | S03, S06, S09; tìm kiếm S11 | Default, focused, filled, error, disabled |
| Card | Sở thích, lịch, nhóm, bản ghi hoạt động | Default, pressed nếu bấm được |
| Navigation | S01, S02, S05, S11 | Trạng thái được chọn cho từng điểm đến |
| App bar | Tiêu đề, Back, thao tác sửa/thêm | Default, có action |
| Dialog | Kết thúc hoạt động, tham gia, bỏ thay đổi | Xác nhận và biến thể hủy hoặc báo lỗi |
| Loading | Tải danh sách, lưu hoạt động | Ít nhất một pattern ở mức màn hình; có thể dùng spinner hoặc skeleton |
| Empty | Chưa có sở thích, chưa có lịch, không có kết quả | Icon hoặc minh họa, thông báo và một hành động phù hợp |
| Error | Lỗi tải, lỗi lưu, lỗi tham gia | Thông báo dễ hiểu, lý do khi xác định được và hành động thử lại |

Đặt trạng thái cạnh màn hình gốc trong Figma và ghi tên rõ ràng. Component dùng Auto Layout, variants và token từ Design System. Các số đo contrast, vùng chạm và kiểm tra ở 360/412 dp cần có bằng chứng, sau đó ghi kết quả vào `design-decisions.md`; việc ghi yêu cầu trong tài liệu này chưa thay cho kiểm tra UI thực tế.

## 7. Các tình huống đối chiếu trước khi bàn giao thiết kế

| Flow | Tình huống cần chạy thử | Kết quả mong đợi |
| --- | --- | --- |
| F01 | Tạo lịch nhanh từ S01 với sở thích đã có | Lưu được và mở S07; kiểm tra mục tiêu tối đa 30 giây trong persona |
| F01 | Tên sở thích trống/trùng, lịch nhập sai hoặc giao nhau | Có hướng dẫn sửa; giữ dữ liệu; lịch giao nhau cho đổi giờ hoặc xác nhận giữ |
| F01 | Từ chối quyền thông báo | Vẫn lưu được lịch không nhắc; S07 hiển thị đúng lời nhắc đang tắt |
| F02 | Bắt đầu từ hoạt động có lịch hoặc sở thích gần đây | Tương ứng 2 hoặc tối đa 3 thao tác từ S01; timer gắn đúng sở thích |
| F02 | Tạm dừng, hủy overlay, kết thúc sớm, ghi nhận thủ công | Giữ thời gian/dữ liệu đúng; không tự lưu khi hủy hoặc chỉ xem màn hình |
| F02 | Từ chối quyền ảnh, lưu lỗi rồi thử lại | Vẫn lưu không ảnh; dữ liệu không mất khi lỗi; chỉ tăng thống kê một lần khi thành công |
| F02 | Loading ở S09 chuyển sang S10 | Guitar đổi từ 75 phút/3 buổi sang 100 phút/4 buổi; Back về S04, không mở lại timer đã kết thúc |
| F03 | Tìm nhóm, hủy xác nhận rồi tham gia lại | Hủy giữ trạng thái chưa tham gia; xác nhận thành công mới hiển thị Đã tham gia |
| F03 | Không có kết quả, lỗi tải hoặc lỗi tham gia | Có cách đổi từ khóa/bộ lọc hoặc thử lại; Back không mất ngữ cảnh |
| Cả ba | Back, nội dung dài, bàn phím, bố cục 360/412 dp | Không có ngõ cụt, không che thao tác chính; không tràn hoặc cắt nội dung quan trọng |

Trong Figma, đặt starting point riêng cho F01, F02 và F03. Các tình huống trên là kế hoạch kiểm tra, chưa phải kết quả đã đạt được. Chi tiết layout, component, states, interactions, navigation và UI constraints cho người triển khai sẽ được hoàn thiện trong `handoff/flutter-handoff.md` sau khi thiết kế được chốt.
