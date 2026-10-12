> Cập nhật 11/10/2026: số flow theo yêu cầu mới: F1 Home → tạo hobby → lịch; F2 Focus; F3 Cộng đồng. Tài liệu persona nguồn được giữ và đổi số tham chiếu. Minh/An là proto-persona, chưa có nghiên cứu thực địa.

# FETCH TIMER — PROBLEM & PERSONA

> **Dự án:** Fetch Timer — Hobby Tracker, Personal Schedule & Focus  
> **Học phần:** PRM323 — Lab 2: Thiết kế UI/UX có hỗ trợ AI  
> **Đường dẫn tài liệu:** `ux/persona.md`  
> **Phiên bản:** 1.0 — Tổng hợp yêu cầu và các quyết định đã thảo luận đến ngày 11/10/2026  
> **Trạng thái:** Đặc tả UX ban đầu; persona và chỉ tiêu thử nghiệm **chưa được xác thực bằng nghiên cứu thực địa**.

## 1. Bối cảnh dự án (Project Context)

**Fetch Timer** là ứng dụng **mobile-first** giúp người dùng đưa sở thích cá nhân (hobby) vào thời gian biểu hằng ngày một cách thực tế, tập trung thực hiện và chia sẻ trải nghiệm với cộng đồng. Ứng dụng kết hợp ba hoạt động vốn thường rời rạc:

1. **Lập kế hoạch và theo dõi sở thích:** Tạo hobby, đặt mục tiêu, xếp lịch theo ngày/tuần, nhận lời nhắc, đánh dấu hoàn thành, bỏ qua hoặc dời lịch.
2. **Tập trung có đo thời gian:** Chọn hobby, sử dụng Pomodoro/đếm giờ/tùy chỉnh, tạm dừng–tiếp tục–kết thúc; lưu thời lượng thực tế, ghi nhật ký và xem tiến độ.
3. **Tìm cảm hứng và chia sẻ:** Đăng bài về hobby, xem bài cộng đồng, tương tác, tham gia thử thách; người xem có thể **thêm một bản sao hobby** vào tài khoản riêng và tự đặt mục tiêu của mình.

### 1.1. Vấn đề trong bối cảnh sử dụng

Sinh viên có lịch học, bài tập, hoạt động nhóm và việc cá nhân đan xen. Họ thường muốn đọc sách, luyện đàn, tập vẽ, vận động hoặc học kỹ năng mới nhưng gặp khó khăn khi:

- Ý định thực hiện hobby không chuyển thành một **khung giờ cụ thể** trong lịch.
- Lời nhắc và kế hoạch nằm ở nhiều nơi; dễ quên hoặc mất nhịp duy trì.
- Khi đã dành thời gian cho hobby, người dùng dễ bị xao nhãng và khó biết **đã tập trung bao lâu**.
- Không nhìn thấy sự tiến bộ nên thiếu động lực tiếp tục; bỏ lỡ một ngày dễ gây cảm giác nản.
- Muốn tìm người có cùng hobby hoặc học hỏi từ trải nghiệm người khác nhưng khó biến cảm hứng ấy thành **một mục tiêu cá nhân khả thi**.
- Ảnh và kỷ niệm gắn với hobby bị lưu riêng lẻ, khó xem lại theo từng hành trình.

Những điểm này là **giả thuyết vấn đề được rút ra từ yêu cầu sản phẩm**, chưa phải kết quả phỏng vấn người dùng.

### 1.2. Đối tượng mục tiêu

**Nhóm người dùng chính:** sinh viên đại học khoảng **18–24 tuổi**, có lịch học/việc cá nhân thay đổi, theo đuổi ít nhất một hobby nhưng chưa duy trì được đều đặn. Họ thường sử dụng smartphone trong các khoảng thời gian ngắn giữa những hoạt động hằng ngày và cần thao tác đơn giản, nhanh.

**Nhóm người dùng phụ:** người trẻ muốn tìm ý tưởng hoặc thử thách mới thông qua cộng đồng, đặc biệt là người muốn **lấy cảm hứng từ hobby của người khác** nhưng vẫn giữ kế hoạch và nhật ký của mình tách biệt.

**Giới hạn phạm vi:** Đây là ứng dụng hỗ trợ sở thích, **không phải** ứng dụng học tập, mạng xã hội tổng quát hoặc công cụ ép năng suất. Các hoạt động, thành tích và lời nhắc cần mang tính khích lệ, không trừng phạt khi người dùng bỏ lỡ lịch.

## 2. Persona chính — Minh

> **Loại persona:** Proto-persona (persona giả định dựa trên brief và kịch bản demo, cần kiểm chứng).  
> **Không phải:** Người đã được phỏng vấn hoặc kết quả thống kê thực tế.

| Thuộc tính | Mô tả |
|---|---|
| **Tên hiển thị** | Minh |
| **Tuổi** | 21 |
| **Vai trò** | Sinh viên đại học; cần cân bằng việc học, việc cá nhân và sở thích |
| **Hobby tiêu biểu** | Luyện Guitar, đọc sách, nhiếp ảnh |
| **Thiết bị** | Smartphone dùng để xem lịch, đặt lời nhắc và ghi nhận hoạt động trong ngày; có thể sử dụng máy tính cho việc học. Hệ điều hành và tần suất sử dụng cụ thể **chưa khảo sát**. |
| **Mức độ quen công nghệ** | Có thể thao tác với ứng dụng lịch, mạng xã hội và công cụ nghe nhạc; **giả định để thiết kế**, cần xác nhận khi thử nghiệm. |
| **Động lực chính** | Duy trì sở thích một cách nhẹ nhàng, nhận thấy bản thân tiến bộ và lưu giữ các khoảnh khắc đáng nhớ |

### 2.1. Bối cảnh và một ngày điển hình

Minh phải phân chia thời gian giữa học tập, công việc nhóm và sinh hoạt cá nhân. Khi có thời gian rảnh, Minh muốn đọc vài chục trang sách hoặc luyện Guitar, nhưng không phải ngày nào cũng rảnh cùng một khung giờ. Minh cần **xem nhanh hôm nay có hoạt động nào**, thay đổi lịch nếu bận, bật đồng hồ khi bắt đầu và ghi nhận thời gian thực tế khi kết thúc. Minh cũng thích xem những chia sẻ về Guitar, sách và nhiếp ảnh để duy trì cảm hứng.

**Tình huống minh họa (không phải nhật ký quan sát):** Minh có một hoạt động luyện Guitar vào buổi tối. Nếu có việc học đột xuất, Minh muốn dời sang ngày khác mà không phải xóa rồi tạo lại mọi thông tin. Khi bắt đầu luyện, Minh muốn chuyển từ hoạt động đã lên lịch sang Focus nhanh và sau đó xem lại lịch sử.

### 2.2. Mục tiêu (Goals)

- **G1 — Có kế hoạch cụ thể:** Tạo hoặc chọn hobby, đặt mục tiêu có thể thực hiện và xếp hoạt động vào ngày/giờ phù hợp.
- **G2 — Duy trì linh hoạt:** Biết hoạt động nào đã xong, sắp tới, bỏ qua hoặc cần dời; không mất dữ liệu khi đổi lịch.
- **G3 — Tập trung dễ dàng:** Từ hobby đã chọn có thể bắt đầu một phiên tập trung nhanh, tạm dừng và tiếp tục khi cần.
- **G4 — Thấy tiến bộ:** Theo dõi số phiên, thời gian thực tế, tiến độ ngày/tuần/tháng và các mốc quan trọng.
- **G5 — Giữ kỷ niệm:** Lưu ghi chú hoặc ảnh sau một buổi thực hiện hobby; **không bắt buộc có ảnh**.
- **G6 — Nhận cảm hứng:** Khám phá bài chia sẻ liên quan và có thể chia sẻ hobby của mình khi chủ động chọn công khai.

### 2.3. Pain points và nhu cầu thiết kế

| Mã | Pain point / rào cản | Nhu cầu người dùng | Hàm ý cho UI/UX |
|---|---|---|---|
| **P1** | Lịch học và việc cá nhân thay đổi | Dễ tạo, sửa, dời lịch lặp | Có màn hình Tạo/Sửa hoạt động, trạng thái và xác nhận phạm vi sửa |
| **P2** | Dễ quên hoạt động và mốc thời gian | Lời nhắc và tổng quan trong một nơi | Home, lịch ngày, thông báo, trạng thái đã đọc |
| **P3** | Dễ mất tập trung khi bắt đầu hobby | Bắt đầu Focus ít bước; điều khiển rõ | Chọn hobby, đồng hồ lớn, Pause/Resume và Finish |
| **P4** | Khó thấy kết quả thực hành tích lũy | Thống kê dễ hiểu, không tính trùng | Tổng kết phiên, lịch sử và phân tích tiến độ |
| **P5** | Dễ mất động lực sau khi bỏ lỡ một ngày | Trải nghiệm hỗ trợ, không gây áp lực | Cho phép bỏ qua/dời; không dùng thông điệp phạt hoặc chê trách |
| **P6** | Ghi chú, ảnh và kết quả nằm rải rác | Kỷ niệm gắn với một hobby/phiên | Nhật ký tùy chọn, album và chi tiết kỷ niệm |
| **P7** | Khó biến bài truyền cảm hứng thành hành động | Thêm hobby được chia sẻ vào kế hoạch riêng | CTA “Thêm sở thích”; giữ riêng mục tiêu/lịch của mỗi người |

### 2.4. Nhu cầu accessibility và thói quen dùng thiết bị

**Chưa có bằng chứng** Minh có khuyết tật hoặc nhu cầu trợ năng cá biệt; vì vậy áp dụng các nguyên tắc **thiết kế bao trùm** thay vì gán cho persona một tình trạng y tế:

- Chữ nội dung chính dễ đọc, mục tiêu **từ 14sp trở lên**, phân cấp rõ tiêu đề, nhãn và mô tả.
- Mục chạm chính nên đạt **48 × 48dp trở lên**; không đặt các thao tác nguy hiểm quá sát nút khác.
- Độ tương phản chữ thông thường hướng đến **ít nhất 4.5:1**; trạng thái hoàn thành/trễ/lỗi không chỉ dựa vào màu.
- Thao tác chính có nhãn rõ, icon nhất quán, hiển thị lỗi ngay gần trường liên quan.
- Hỗ trợ cuộn dọc, không để thanh điều hướng nổi che nội dung trên màn hình **360 × 800dp**; kiểm tra thêm chiều rộng **412dp**.
- Không buộc người dùng giữ sự chú ý liên tục trên màn hình; cho phép tạm dừng và lưu tiến trình hợp lý.

### 2.5. Câu nói đại diện

> “Mình muốn dành thời gian cho Guitar và đọc sách đều đặn hơn, nhưng lịch thay đổi liên tục. Mình cần một nơi vừa nhắc lịch, vừa giúp tập trung, vừa cho biết mình đã làm được gì.”

*Câu nói trên là câu minh họa của nhóm thiết kế, không phải trích dẫn phỏng vấn.*

## 3. Persona phụ — An (người khám phá sở thích qua cộng đồng)

> **Loại persona:** Proto-persona hỗ trợ **Flow 03**. Thông tin tuổi và nghề nghiệp bên dưới là giả định để xây dựng kịch bản, không phải dữ liệu khảo sát.

| Thuộc tính | Mô tả |
|---|---|
| **Tên** | An |
| **Tuổi (giả định)** | 20 |
| **Vai trò (giả định)** | Sinh viên muốn khám phá và thử các hobby mới |
| **Động lực** | Xem bài của người có cùng sở thích, học kinh nghiệm và bắt đầu một thử thách vừa sức |
| **Khó khăn** | Nhìn thấy bài hay nhưng không biết biến thành hoạt động cá nhân; lo nội dung cá nhân bị chia sẻ nhầm |
| **Nhu cầu** | Bài viết có thông tin rõ, nút “Thêm sở thích”, thiết lập mục tiêu riêng, quyền riêng tư minh bạch |

**Kịch bản hai tài khoản demo:** Minh chia sẻ một hobby công khai → An xem qua Cộng đồng hoặc carousel Trang chủ → An mở chi tiết bài → chọn **Thêm sở thích** → ứng dụng tạo hobby thuộc tài khoản An để An đặt mục tiêu và lịch riêng. **Không được sao chép** lịch, nhật ký, số liệu Focus hay thông tin riêng tư của Minh.

## 4. Problem statement (Câu phát biểu vấn đề)

**Sinh viên đại học 18–24 tuổi có lịch trình học tập và sinh hoạt thay đổi, như Minh, cần một cách đơn giản để biến sở thích thành hoạt động có lịch, tập trung thực hiện và nhận biết tiến bộ, vì việc lập kế hoạch, đếm thời gian và tìm cảm hứng đang rời rạc khiến họ dễ quên, mất tập trung và khó duy trì sở thích lâu dài.**

### 4.1. Câu hỏi thiết kế — How Might We

**Làm thế nào chúng ta có thể giúp sinh viên duy trì sở thích mỗi ngày bằng một hành trình liền mạch “lên lịch → tập trung → ghi nhận → chia sẻ/nhận cảm hứng”, nhưng vẫn cho phép thay đổi linh hoạt và bảo vệ dữ liệu cá nhân?**

### 4.2. Phạm vi giải pháp

**Trong phạm vi ưu tiên:** tạo/quản lý hobby; mục tiêu và lịch ngày/tuần; nhắc lịch; trạng thái hoạt động; Focus Timer; tổng kết và thống kê; ghi chú/ảnh kỷ niệm; đăng/xem/tương tác bài; thêm hobby từ bài chia sẻ; tham gia/theo dõi thử thách.

**Phần mở rộng đã được phác thảo:** kiến thức, nhóm và thảo luận, hồ sơ thành viên, liên kết Spotify/YouTube, phân tích nâng cao. Các màn hình của phần mở rộng có thể xuất hiện trong bản thiết kế 44 màn hình, nhưng **không phải mục tiêu chính của ba nhiệm vụ kiểm thử**.

**Không giả định đã có backend hoặc API thật:** đồng bộ dữ liệu hai tài khoản, thông báo hệ thống, Spotify/YouTube và đồng hồ thời gian thực có thể là **mô phỏng Prototype**, phải ghi rõ mức độ hoạt động khi demo.

## 5. Tổng hợp 10 User Stories đã cung cấp

Bảng sau giữ nguyên ý nghĩa của 10 user stories trong tài liệu gốc `HOBBY TRACKER USER STORIES.docx`; cách viết được chuẩn hóa để có thể liên kết đến giải pháp và kiểm thử.

| ID | Nhu cầu người dùng | Biểu hiện trong Fetch Timer | Ưu tiên |
|---|---|---|---|
| **US01** | Sắp xếp thời gian biểu, sự kiện, nhiệm vụ và lịch trình | Hobby, hoạt động, lịch Ngày/Tuần/Tháng | Cốt lõi – Flow 01 |
| **US02** | Báo thức/nhắc nhở và đánh dấu mốc | Lời nhắc, thông báo, đánh dấu hoàn thành, thành tích | Cốt lõi/hỗ trợ |
| **US03** | Tích hợp Spotify và YouTube để hỗ trợ tập trung | Chọn nguồn âm thanh trong Focus; kết nối thật là mở rộng | Hỗ trợ – Flow 02 |
| **US04** | Tăng tập trung qua nhắc nhở hằng ngày | Lịch, thông báo, lời nhắc Focus | Cốt lõi/hỗ trợ |
| **US05** | Tối ưu thời gian dành cho hobby | Focus Timer và tổng kết thời gian thực tế | Cốt lõi – Flow 02 |
| **US06** | Theo dõi sâu và tìm nội dung chuyên môn về hobby | Thống kê, lịch sử, bài kiến thức theo chủ đề | Cốt lõi + mở rộng |
| **US07** | Kết nối người có cùng sở thích | Bài đăng, bình luận, tương tác, thử thách; nhóm là mở rộng | Cốt lõi – Flow 03 |
| **US08** | Biến hobby thành phần ý nghĩa của đời sống | Mục tiêu đều đặn, mốc tiến bộ, ghi nhận thành quả | Xuyên suốt |
| **US09** | Nhận cảm hứng mỗi ngày | Carousel gợi ý “Dành cho bạn / Phổ biến / Mới nhất”, thử thách | Cốt lõi/hỗ trợ |
| **US10** | Lưu giữ khoảnh khắc qua hình ảnh | Nhật ký, album, ghi chú, ảnh tùy chọn | Cốt lõi – Flow 02 |

## 6. Ba nhiệm vụ trọng tâm suy ra từ persona

### Task 01 — Tạo hobby và theo dõi theo ngày

- **Mục tiêu của Minh:** Thêm hobby Guitar và lên lịch một hoạt động luyện tập trong tuần; sau đó xem, sửa hoặc đánh dấu kết quả.
- **Hành trình đại diện:** M02/M06 → M07 → M08 → M10 → M12 → M02.
- **Nhánh thay thế:** Chọn hobby mẫu thay vì tự tạo; dời lịch thay vì hoàn thành.
- **Nhánh lỗi/phục hồi:** Thiếu tên, giờ không hợp lệ hoặc trùng giờ → xem thông báo cụ thể → chỉnh lại → lưu thành công.
- **Nhu cầu UX:** Form ngắn gọn, dữ liệu nhập được giữ khi báo lỗi, lịch đã lưu có thể tìm thấy ngay.

### Task 02 — Focus, lưu kết quả và xem tiến độ

- **Mục tiêu của Minh:** Chọn hobby, bắt đầu phiên Pomodoro/đếm giờ, tạm dừng khi bị gián đoạn, hoàn thành và xem kết quả.
- **Hành trình đại diện:** M03 → M15 → M16 → M18 → (M19 tùy chọn) → M23/M24.
- **Nhánh thay thế:** Bỏ qua chọn nhạc; hoàn thành không thêm ảnh; kết thúc sớm sau xác nhận.
- **Nhánh lỗi/phục hồi:** Thử kết thúc giữa chừng → hộp thoại xác nhận → chọn Tiếp tục để quay lại phiên.
- **Nhu cầu UX:** Thời gian nổi bật, trạng thái Pause/Resume phân biệt rõ, số phút ghi nhận dựa trên thực tế, không lưu trùng phiên.

### Task 03 — Chia sẻ hobby và tiếp nhận từ cộng đồng

- **Mục tiêu của Minh:** Chia sẻ hobby kèm nội dung/ảnh khi chủ động chọn quyền hiển thị.
- **Mục tiêu của An:** Xem bài đăng công khai và thêm một bản sao hobby vào tài khoản để tự đặt mục tiêu.
- **Hành trình đại diện:** Minh M08 → M34 → M35 → M04/M01; An M04/M01 → M35 → M07 → M08.
- **Nhánh thay thế:** Lưu bài, bình luận hoặc tham gia thử thách thay vì thêm hobby.
- **Nhánh lỗi/phục hồi:** Đăng lỗi mạng → Thử lại; hobby đã tồn tại → Mở hobby hiện có.
- **Nhu cầu UX:** Quyền riêng tư rõ ràng; CTA “Thêm sở thích” dễ tìm; không rò rỉ lịch/nhật ký cá nhân.

> Sơ đồ và bảng ánh xạ đầy đủ các màn hình phải được duy trì tại **`ux/user-flow.md`** theo yêu cầu Lab; mục này chỉ kết nối persona với ba công việc cốt lõi.

## 7. Tiêu chí thành công đo được (Measurable Success Criteria)

**Các số dưới đây là ngưỡng mục tiêu thiết kế để kiểm thử trong tương lai, KHÔNG phải kết quả kiểm thử đã thực hiện.**

### 7.1. Tiêu chí thành công chính

> **Trong một bài kiểm thử có nhiệm vụ định sẵn, ít nhất 80% người tham gia thuộc nhóm mục tiêu có thể tạo một hobby, đặt mục tiêu và lập lịch cho một hoạt động hợp lệ trong tối đa 3 phút, không cần người hướng dẫn can thiệp.**

- **Bắt đầu đo:** Từ lúc xuất hiện M02 (Lịch trình) hoặc M06 (Sở thích của tôi) với nhiệm vụ được đọc rõ.
- **Kết thúc đo:** Khi hoạt động xuất hiện trên lịch/ngày đã chọn và người thử chỉ ra đúng kết quả.
- **Thành công:** Đúng hobby, đúng ngày/giờ, lưu được, không cần trợ giúp.
- **Không thành công:** Bỏ cuộc, lạc luồng, dữ liệu không xuất hiện, hoặc vượt quá thời gian.

### 7.2. Các tiêu chí bổ sung

| Mã | Điều cần đo | Ngưỡng mục tiêu đề xuất | Cách đo |
|---|---|---|---|
| **SC01** | Tạo hobby và lịch (Task 01) | **≥80%** hoàn thành trong **≤3 phút** | Quan sát tác vụ, bấm giờ, ghi số lần trợ giúp |
| **SC02** | Bắt đầu phiên Focus | **≥80%** bắt đầu trong **≤60 giây** và không quá **3 thao tác chính từ M03** | Đếm thao tác, bấm giờ đến trạng thái đang chạy |
| **SC03** | Tạm dừng/tiếp tục Focus | **≥80%** tìm và sử dụng đúng Pause/Resume trong **≤15 giây** mỗi thao tác | Quan sát M16, xác nhận nhận biết trạng thái |
| **SC04** | Minh đăng và An thêm hobby (Task 03) | **≥80%** hoàn thành mỗi vai trò trong **≤3 phút** | Hai tác vụ tách biệt; kiểm tra kết quả ở tài khoản An |
| **SC05** | Hiểu quyền riêng tư khi chia sẻ | **≥90%** trả lời đúng thông tin nào là công khai, và trong demo **0 trường hợp** hiển thị lịch/nhật ký riêng của Minh cho An | Câu hỏi kiểm tra hiểu biết + rà soát dữ liệu demo |
| **SC06** | Phục hồi sau lỗi trùng giờ/thiếu dữ liệu | **≥80%** khắc phục và lưu thành công trong **≤60 giây** sau khi thông báo lỗi xuất hiện | Quan sát nhánh lỗi của Task 01 |
| **SC07** | Kết thúc Focus và xem lại | **≥80%** tìm thấy tổng kết và lịch sử đúng hobby trong **≤60 giây** sau khi sử dụng nút hoàn thành demo | Kiểm tra M18, M23/M24; không tính thời gian chờ timer thật |

*Các ngưỡng 80%, 90%, 60 giây và 3 phút là **đề xuất đo kiểm do nhóm thiết kế đặt ra**, không phải số liệu thu thập hoặc ngưỡng bắt buộc được PDF quy định. Mốc “bắt đầu Focus không quá 3 thao tác” và định hướng tạo hoạt động nhanh cũng có trong brief/prompt Fetch Timer đã trao đổi.*

### 7.3. Kế hoạch kiểm thử để kiểm chứng persona

**Đề xuất phương pháp:** mời khoảng **5 người** thuộc nhóm mục tiêu phù hợp làm thử ba tác vụ trên Prototype Figma; không hướng dẫn nút bấm trong khi họ thao tác. Mẫu nhỏ dùng để **phát hiện vấn đề thiết kế**, không đủ đại diện thống kê cho toàn bộ sinh viên.

Ghi lại cho từng tác vụ: thời gian, hoàn thành/chưa hoàn thành, số thao tác, lần quay lại, lỗi, nhờ trợ giúp, nhận xét tự phát và mức hiểu về quyền riêng tư. Sau mỗi tác vụ có thể hỏi mức độ dễ thực hiện (thang 1–5). Nếu kết quả không đạt ngưỡng, ưu tiên sửa những bước gây lạc luồng trước khi tăng số màn hình.

**Chưa được thực hiện/chưa có bằng chứng trong nguồn:** phỏng vấn người dùng; khảo sát định lượng; kết quả usability test; sự phê duyệt chủ đề của giảng viên. Cần bổ sung bằng chứng thực tế nếu báo cáo học phần yêu cầu.

## 8. Những quyết định UI/UX xuất phát từ persona và cuộc trao đổi PRM

| Quyết định | Lý do gắn với persona / problem |
|---|---|
| **Mobile-first; UI tiếng Việt** | Thao tác ngắn giữa các hoạt động trong ngày, giảm tải nhận thức |
| **5 mục chính:** Trang chủ, Lịch trình, Tập trung, Cộng đồng, Cá nhân | Người dùng nhận diện được ba luồng chính và truy cập nhanh |
| **Thanh menu nổi hình viên thuốc, nút Tập trung tròn xanh nhô giữa** | Tăng nhận biết hành động bắt đầu Focus mà vẫn thống nhất điều hướng |
| **Lịch Ngày / Tuần / Tháng, thời gian và trạng thái rõ** | Hỗ trợ lịch cá nhân thay đổi và đánh dấu tiến độ |
| **Carousel trên Home:** “Dành cho bạn / Phổ biến / Mới nhất” | Đem nguồn cảm hứng vào điểm người dùng mở app thường xuyên |
| **Có thể lưu hobby từ bài đăng vào tài khoản riêng** | Biến cảm hứng thành hành động cá nhân, không sao chép dữ liệu riêng |
| **Focus Timer có Pause / Resume / Finish** | Cho phép gián đoạn thường gặp trong đời sống sinh viên |
| **Nhật ký và ảnh là tùy chọn** | Không gây thêm gánh nặng sau một phiên tập trung |
| **Nhắc nhở/achievement không mang tính trừng phạt** | Hỗ trợ duy trì hobby tích cực, không gây áp lực khi bỏ lỡ |
| **Trạng thái Error / Empty / Loading / Success** | Giúp người dùng hiểu điều gì xảy ra và phục hồi sau lỗi |
| **Một Design System nhất quán giữa các đợt Stitch/Figma** | Tránh làm người dùng học lại điều hướng khi chuyển màn hình |

**Thiết kế tham chiếu:** phong cách Premium Light, nền trắng kem, xanh lá chủ đạo, các thẻ pastel, thứ bậc chữ rõ ràng, độ tương phản phù hợp, ít chi tiết trang trí vô ích. Các quyết định màu sắc và component chi tiết phải ghi ở `design/DESIGN.md`, không dùng persona để thay thế tài liệu thiết kế.

## 9. Phạm vi thiết kế và tài liệu liên quan

Bản đặc tả UI đã trao đổi gồm **44 màn hình M01–M44, chia 5 khu vực**:

| Khu vực | Mã | Số màn hình |
|---|---|---:|
| A — Trang chủ | M01 | 1 |
| B — Lịch trình & Sở thích | M02, M06–M14 | 10 |
| C — Tập trung & Nhật ký | M03, M15–M24 | 11 |
| D — Cộng đồng & Thử thách | M04, M25–M37 | 14 |
| E — Cá nhân & Cài đặt | M05, M38–M44 | 8 |
| **Tổng** | **M01–M44** | **44** |

`M00` là quy chuẩn thiết kế chung, **không phải màn hình thứ 45**.

**Lưu ý về thay đổi phạm vi:** Ở một vòng trao đổi PRM gần đây, nhóm đã muốn **rút gọn Cộng đồng** về các tác vụ đăng bài, xem bài, bình luận và tham gia/theo dõi thử thách để tập trung ba flow. Bảng 44 màn hình phía trên là **danh mục thiết kế đã có**, không đồng nghĩa tất cả tính năng nhóm/kiến thức trong 14 màn hình Cộng đồng đều bắt buộc phải demo. Khi chốt bản nộp, ghi rõ màn nào là cốt lõi và màn nào là mở rộng trong `ux/user-flow.md` để tránh hai phiên bản phạm vi bị hiểu lẫn nhau.

**Cấu trúc Figma theo đề:** `01 User Flow`, `02 Wireframe`, `03 Final UI`, `04 Design System`, `05 Components`, `06 Prototype`. Năm khu vực A–E là **Sections bên trong `03 Final UI`**, không thay thế sáu Page. Thiết kế cuối dựa trên khung **360 × 800dp**, kiểm tra thêm **412dp**.

Các tài liệu liên kết:

- `ux/persona.md` — **tài liệu này**: bối cảnh, đối tượng, persona, vấn đề, tiêu chí đo lường.
- `ux/user-flow.md` — information architecture, sơ đồ ba flow, nhánh thay thế/lỗi, bảng ánh xạ các màn hình.
- `design/DESIGN.md` — token, typography, spacing, component, accessibility.
- `design/screen-spec.md` — chức năng, nội dung, trạng thái và điều hướng từng màn hình.
- `design/design-decisions.md` — giải thích quyết định chấp nhận/sửa/từ chối đề xuất AI.
- `ai/ai-design-log.md` — prompt Stitch, ảnh kết quả, tối thiểu ba vòng cải tiến có trước/sau và phản biện cụ thể.
- `handoff/flutter-handoff.md` — bàn giao cho lập trình viên Flutter; không yêu cầu phải triển khai Flutter trong Lab 2.

## 10. Cơ sở thông tin, giả định và giới hạn

### 10.1. Nguồn đã sử dụng

1. **`HOBBY TRACKER USER STORIES.docx`** — 10 user stories gốc của Fetch Timer.
2. **`PRM323 - Lab 2 Thiết kế UI UX có hỗ trợ AI (bản tiếng Việt).pdf`** — yêu cầu chính thức đối với `ux/persona.md`, luồng và sản phẩm Figma.
3. **Các cuộc trao đổi PRM/Fetch Timer** — ba luồng ưu tiên, dữ liệu hai tài khoản Minh/An, thanh menu, banner Home, UI tiếng Việt, cách tổ chức 44 màn hình và nguyên tắc giữ đồng nhất.
4. **Brief/prompt dự án đã tạo trước đó** — mô tả Minh (21 tuổi, sinh viên; Guitar/đọc sách/nhiếp ảnh), định hướng thực hiện hoạt động nhanh, Focus ít thao tác, không ép buộc gamification.

### 10.2. Điểm cần xác minh sau này

- Persona Minh và An có đại diện đúng cho người dùng mục tiêu không? Tuổi, lịch sinh hoạt, loại hobby và thói quen công nghệ đã giả định có hợp lý không?
- Người dùng có ưu tiên **lên lịch → Focus** hơn **khám phá → thêm hobby** không?
- Người dùng có hiểu sự khác nhau giữa **chia sẻ hobby** và **chia sẻ lịch/nhật ký cá nhân** không?
- Nhắc lịch với tần suất nào được xem là hữu ích, không gây phiền?
- Sau khi kiểm thử, các mục tiêu về thời gian/số bước/tỷ lệ thành công có đạt không?

> **Nguyên tắc báo cáo:** Persona giả định và tiêu chí đề xuất là cơ sở để thiết kế/kiểm thử, **không được trình bày như kết quả nghiên cứu đã diễn ra**. Chỉ thay bằng kết luận thực nghiệm khi có biên bản hoặc bằng chứng kiểm thử thực tế.
