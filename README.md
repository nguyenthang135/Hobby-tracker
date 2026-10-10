# Hobby Tracker

### Dành thời gian cho điều mình thích, nhìn lại những gì mình đã làm.

Hobby Tracker là ý tưởng ứng dụng di động giúp người dùng quản lý sở thích, lên lịch thực hiện, ghi nhận hoạt động và theo dõi tiến bộ. Thay vì chỉ đếm thời gian tập trung, ứng dụng gắn mỗi hoạt động với một sở thích cụ thể để người dùng biết mình đã dành thời gian cho điều gì và duy trì nó như thế nào.

Dự án hướng đến sinh viên có lịch học thay đổi, thường chỉ có những khoảng rảnh ngắn để đọc sách, tập guitar hoặc thực hiện sở thích cá nhân.

> **Trạng thái hiện tại:** đã soạn persona, user flow và đặc tả 12 màn hình để chuẩn bị thiết kế. Chưa có bản UI, prototype hoặc kết quả kiểm thử người dùng. Repo phục vụ **Lab 2 — Thiết kế UI/UX có hỗ trợ AI (PRM323)**, chưa triển khai ứng dụng Flutter hay backend.

[Persona](ux/persona.md) · [User flow](ux/user-flow.md) · [Đặc tả màn hình](design/screen-spec.md) · [Design brief](design/DESIGN.md)

## Người dùng và bài toán

**Persona chính:** Minh Anh, 20 tuổi, sinh viên năm hai, muốn duy trì việc đọc sách và tập guitar trong những khoảng rảnh 15–45 phút.

Lịch học, bài tập và việc cá nhân khiến Minh Anh khó giữ một khung giờ cố định cho sở thích. Khi rảnh, Minh Anh cần chọn được việc muốn làm, bắt đầu nhanh và lưu lại kết quả để không phải tự nhớ những buổi trước.

> “Tối nay mình rảnh 25 phút trước giờ họp nhóm. Mình muốn tập guitar, bắt đầu nhanh và lưu lại thời gian đã tập.”

Persona này là giả định thiết kế đã thống nhất cho dự án, chưa được xác thực bằng phỏng vấn hoặc khảo sát. Xem bối cảnh, nhu cầu và mục tiêu kiểm thử trong [persona.md](ux/persona.md).

## Phạm vi thiết kế đã thống nhất

| Nhóm chức năng | Nội dung trong phạm vi |
| --- | --- |
| Quản lý sở thích | Thêm, sửa, xem chi tiết sở thích; đặt mục tiêu thời gian mỗi tuần nếu muốn. |
| Lên lịch hoạt động | Chọn sở thích, ngày, giờ và thời lượng; đặt lời nhắc tùy chọn; xử lý nhập thiếu và lịch giao nhau. |
| Thực hiện và ghi nhận | Timer hỗ trợ hoạt động, có tạm dừng và tiếp tục; ghi nhận thủ công khi không dùng timer; thêm ghi chú hoặc ảnh tùy chọn. |
| Theo dõi tiến bộ | Xem thời gian đã thực hiện, số buổi, lịch sử và tiến độ theo mục tiêu tuần nếu có. |
| Khám phá cộng đồng | Tìm nhóm theo sở thích, xem thông tin và nội dung gợi cảm hứng mẫu, xác nhận tham gia nhóm. |

Quản lý và theo dõi sở thích là trọng tâm; timer và lời nhắc là công cụ hỗ trợ. Cộng đồng là luồng bổ trợ, ưu tiên thấp hơn các tác vụ cá nhân.

**Chưa đưa vào phạm vi hiện tại:** tích hợp Spotify/YouTube, báo thức độc lập, tư vấn chuyên sâu, nhắn tin, đăng bài, quản trị nhóm và màn hình đăng nhập/đăng ký. Các nội dung này cần thống nhất yêu cầu riêng trước khi mở rộng. Prototype dùng dữ liệu mẫu, không yêu cầu dịch vụ thật.

Cách đối chiếu và điều chỉnh từng nhu cầu từ user stories được ghi trong [user-flow.md](ux/user-flow.md). File user stories gốc dùng tên Fetch Timer; tên sản phẩm thống nhất trong repo này là **Hobby Tracker**.

## Ba luồng sử dụng chính

| Flow | Mục tiêu | Kết quả hoàn thành | Nhánh thay thế hoặc phục hồi |
| --- | --- | --- | --- |
| **F01 — Quản lý sở thích và lên lịch** | Chọn hoặc thêm sở thích, rồi tạo lịch hoạt động. | Chi tiết hoạt động hiển thị lịch đã lưu. | Sửa thông tin chưa hợp lệ, xử lý lịch giao nhau, hoặc lưu không có lời nhắc khi không cấp quyền thông báo. |
| **F02 — Thực hiện, ghi nhận và xem tiến bộ** | Thực hiện hoạt động bằng timer hoặc ghi nhận thủ công. | Lưu thành công và xem tiến bộ của sở thích tương ứng. | Tạm dừng, kết thúc sớm, bỏ qua ảnh; nếu lưu lỗi thì giữ dữ liệu để sửa hoặc thử lại. |
| **F03 — Khám phá và tham gia nhóm** | Tìm nhóm phù hợp, xem trước thông tin và xác nhận tham gia. | Chi tiết nhóm hiển thị trạng thái đã tham gia. | Đổi từ khóa khi không có kết quả, hủy xác nhận hoặc thử lại khi tải/tham gia lỗi. |

Thiết kế gồm **12 màn hình riêng biệt (S01–S12)**, với bốn mục điều hướng chính: **Trang chủ · Sở thích · Lịch · Cộng đồng**. Dialog, loading, empty và error là trạng thái của màn hình, không tính thành màn hình riêng.

Sơ đồ Mermaid, điểm bắt đầu/kết thúc, happy path, quy tắc Back và bảng ánh xạ flow → màn hình nằm trong [user-flow.md](ux/user-flow.md). Nội dung, hành động và trạng thái của từng màn hình nằm trong [screen-spec.md](design/screen-spec.md).

## Tài liệu trong repo

```text
Hobby-tracker/
├── README.md
├── ux/
│   ├── persona.md
│   └── user-flow.md
├── design/
│   ├── DESIGN.md
│   ├── screen-spec.md
│   └── design-decisions.md
├── ai/
│   └── ai-design-log.md
├── assets/
│   ├── stitch/
│   └── figma/
└── handoff/
    └── flutter-handoff.md
```

| Tài liệu / thư mục | Dùng để làm gì? | Trạng thái |
| --- | --- | --- |
| [ux/persona.md](ux/persona.md) | Hiểu người dùng chính, bài toán và mục tiêu kiểm thử. | Đã soạn; chưa xác thực với người dùng. |
| [ux/user-flow.md](ux/user-flow.md) | Xem 12 màn hình, điều hướng, ba flow và cách xử lý nhánh thay thế. | Đã soạn; cần kiểm chứng trên prototype. |
| [design/screen-spec.md](design/screen-spec.md) | Chuẩn bị prompt và dựng UI theo nội dung, hành động, trạng thái của từng màn hình. | Đã soạn. |
| [design/DESIGN.md](design/DESIGN.md) | Chốt màu, typography, spacing, bo góc, elevation, tone và quy tắc component. | Chưa điền; bạn phụ trách Stitch sẽ đề xuất và chốt trước khi tạo UI. |
| [design/design-decisions.md](design/design-decisions.md) | Ghi các quyết định thiết kế chính, lý do và kết quả kiểm tra accessibility. | Chưa điền. |
| [ai/ai-design-log.md](ai/ai-design-log.md) | Lưu công cụ, prompt nguyên văn, đầu ra, critique và các vòng chỉnh sửa. | Chưa điền. |
| [assets/stitch/](assets/stitch/) | Lưu ảnh kết quả Stitch, gồm bản ban đầu và các lần điều chỉnh. | Chưa có ảnh. |
| [assets/figma/](assets/figma/) | Lưu ảnh thiết kế Figma và bằng chứng trước/sau khi tinh chỉnh. | Chưa có ảnh. |
| [handoff/flutter-handoff.md](handoff/flutter-handoff.md) | Mô tả cách chuyển thiết kế sang Flutter, không phải mã nguồn ứng dụng. | Chưa điền. |

## Bắt đầu phần Stitch và Figma

Quy trình theo tài liệu Lab 2: **Analyze → Generate → Critique → Refine → Prototype → Handoff**.

1. Đọc lần lượt persona → user flow → screen spec. Giữ mã S01–S12 và F01–F03 xuyên suốt prompt, frame và prototype.
2. Bạn phụ trách Stitch đề xuất phong cách và hoàn thiện [DESIGN.md](design/DESIGN.md) trước khi tạo UI. Hiện chưa chốt bảng màu, font hoặc giá trị token cụ thể.
3. Tạo UI bằng Stitch dựa trên design brief và screen spec. Lưu prompt nguyên văn, toàn bộ đầu ra và ảnh kết quả gốc vào các vị trí tương ứng trong repo.
4. Dùng AI hỗ trợ critique theo persona, Nielsen heuristics và accessibility. Ghi ít nhất năm nhận xét gắn với màn hình cụ thể, quyết định tiếp nhận/sửa/từ chối cùng lý do; thực hiện ít nhất ba vòng cải tiến UX có ý nghĩa, kèm bằng chứng trước/sau.
5. Hoàn thiện Figma với đúng sáu page theo thứ tự: `01 User Flow`, `02 Wireframe`, `03 Final UI`, `04 Design System`, `05 Components`, `06 Prototype`.
6. Nối prototype cho cả ba flow, kiểm tra nhánh thay thế và khả năng phục hồi; hoàn thiện quyết định thiết kế, Flutter handoff và cập nhật liên kết bàn giao bên dưới.

### Ràng buộc cần giữ khi thiết kế

- Khung chính **360 × 800 dp**; kiểm tra thêm chiều rộng **412 dp**. Hướng thích ứng từ **600 dp** được mô tả trong Flutter handoff.
- Có **light theme**; dark theme là tùy chọn. Dùng Auto Layout, constraints, Variables/styles và component tái sử dụng.
- Vùng chạm tối thiểu **48 × 48 dp**, chữ nội dung tối thiểu **14 sp**. Contrast tối thiểu **4.5:1** cho chữ thường, **3:1** cho chữ lớn và các điều khiển UI theo yêu cầu Lab 2; không truyền đạt thông tin chỉ bằng màu.
- Chuẩn bị chín nhóm component/pattern: **Button, Text field, Card, Navigation, App bar, Dialog, Loading, Empty, Error**, với trạng thái phù hợp theo screen spec.
- Prototype có điểm bắt đầu cho từng flow, điều hướng Back và không có ngõ cụt; thể hiện ít nhất một **dialog overlay** và một chuyển tiếp **loading → kết quả**.

Mục tiêu dự kiến là tạo lịch trong tối đa **30 giây** và bắt đầu timer trong tối đa **ba thao tác từ Trang chủ** với người dùng đã có sở thích. Đây là mục tiêu để kiểm thử, chưa phải kết quả đo được.

## Công cụ và liên kết bàn giao

| Công cụ | Vai trò | Tình trạng sử dụng |
| --- | --- | --- |
| ChatGPT / Codex | Hỗ trợ phân tích phạm vi, soạn và rà soát tài liệu UX; hỗ trợ critique ở bước tiếp theo. | Đã dùng để chuẩn bị tài liệu; cần bổ sung lịch sử vào AI design log. |
| Google Stitch | Tạo phương án UI từ prompt và design brief. | Chưa có kết quả trong repo. |
| Figma | Hoàn thiện wireframe, Final UI, design system, components và prototype. | Chưa có liên kết bàn giao. |
| GitHub | Quản lý phiên bản và tập hợp tài liệu bàn giao. | [Repository Hobby Tracker](https://github.com/nguyenthang135/Hobby-tracker). |

**Figma design:** chưa có — bổ sung liên kết khi tạo file và mở quyền xem.

**Figma prototype:** chưa có — bổ sung liên kết điểm bắt đầu demo khi hoàn thiện.

Các công cụ AI phát sinh trong quá trình làm cần được khai báo thêm trong README và [ai-design-log.md](ai/ai-design-log.md). Trước khi nộp, kiểm tra người nhận có thể mở cả GitHub repo và Figma bằng quyền xem phù hợp.

---

Repo hiện là bộ tài liệu để bắt đầu thiết kế, nên chưa có hướng dẫn cài đặt hoặc chạy ứng dụng. Bước tiếp theo là chốt **DESIGN.md**, sau đó tạo và đánh giá phương án UI trên **Stitch → Figma**.
