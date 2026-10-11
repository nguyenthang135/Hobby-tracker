# Flutter handoff — Fetch Timer

Không triển khai Flutter code trong Lab 2. Đây là đặc tả đích do nhóm chuẩn bị cho lập trình viên. Layout/token/state chưa được xác nhận đầy đủ trong file Figma hiện tại.

## Quy ước chung

Base 360×800dp, test 412dp; SafeArea; screen padding 16, gap 8/12, section gap24. AppBar cao tối thiểu56dp; button height≥48dp. Content cuộn với bottom padding108dp khi có menu nổi. Dùng ThemeData/TextTheme/AppSpacing trong DESIGN.md. Form resizeToAvoidBottomInset, scroll field đang focus vào viewport. Ảnh giữ aspect ratio, loading skeleton, error fallback. Text body≥14sp; không truncate tên hobby trong trang chi tiết, list tối đa2 dòng + ellipsis.

## Token → Flutter

Bảng đầy đủ màu, text style, spacing, radius và elevation tại [DESIGN.md](../design/DESIGN.md). Bảng sau là mapping dùng chung khi triển khai.

| Nhóm | Token / giá trị | Flutter đích |
|---|---|---|
| Màu brand | primary #006A39; onPrimary #FFFFFF | ColorScheme.primary/onPrimary |
| Màu nội dung | surface #F9FAF8; onSurface #191C1B; onSurfaceVariant #3E4A40 | ColorScheme.surface/onSurface/onSurfaceVariant |
| Card/outline | white; outline #6E7A6F; outlineVariant #BDCABD | surfaceContainerLowest/outline/outlineVariant |
| Secondary | #9EF5BF / #157348 | secondaryContainer/onSecondaryContainer |
| Lỗi | #BA1A1A / white / #FFDAD6 / #93000A | error/onError/errorContainer/onErrorContainer |
| Pastel | #E8F6ED/#F1EAFC/#FFF4DC/#E8F2FF | AppColors.categoryGreen/Purple/Yellow/Blue |
| Text Inter | 28/36 bold, 22/28 semi, 18/24 semi, 16/22 semi | headlineSmall/titleLarge/titleMedium/titleSmall |
| Body/label | 16/24 regular,14/20 regular,14/20 semi,14/20 medium | bodyLarge/bodyMedium/labelLarge/bodySmall |
| Spacing | 4/8/12/16/24 | AppSpacing.xs/sm/md/lg/xl |
| Inset | margin16, gutter12, bottom108, minTap48 | AppDimensions |
| Radius | 4/8/12/16/24/9999 | AppRadius |
| Elevation | 0/2/8 | AppElevation.flat/raised/overlay |

## Component → widget

| Component | Widget dự kiến | State mapping |
|---|---|---|
| Button | FilledButton / OutlinedButton | disabled onPressed=null; loading spinner + disabled; pressed WidgetState |
| TextField | TextFormField | validator/errorText, focusNode, enabled, controller |
| Card | Card + InkWell | onTap + pressed, padding16 |
| Navigation | NavigationBar; NavigationRail ≥600dp | selectedIndex theo destination, Semantics label |
| AppBar | AppBar | title, leading Back, actions |
| Dialog | AlertDialog + showDialog | confirm/cancel/error, focus và barrier semantics |
| Loading | CircularProgressIndicator / skeleton | status semantic, tránh lặp request |
| Empty | Custom EmptyView | icon, message, action button |
| Error | Custom ErrorView | cause, retry, giữ form/query |

## Data và validation đích

Hobby{id,ownerId,name,category,targetUnit,targetValue,repeatDays}; Activity{id,hobbyId,date,start,end,status,notes}; FocusSession{id,hobbyId,startedAt,activeSeconds,phase,plannedSeconds}; Post{id,ownerId,hobbyId,title,content,visibility,images}; Membership{groupId,userId,status}; Enrollment{challengeId,userId,joinedAt,checkIns}. ID là hợp đồng dữ liệu đề xuất, không suy ra backend tồn tại.

Timer dựa timestamp/elapsed để tránh drift, không dựa chỉ tick UI. Pause loại thời gian nghỉ. Finish dùng activeSeconds, idempotent save theo sessionId. Hobby import từ bài chỉ lấy template công khai, sinh ownerId/hobbyId mới. Tránh copy activity/session/memory của tác giả. Check-in không đồng nghĩa đã Focus nếu rule challenge không cho phép.

## Sáu mục cho từng màn hình

### M01 — Trang chủ

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tổng quan hôm nay, mục tiêu, hobby và nguồn cảm hứng. NavigationBar cố định và content inset108.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Navigation/selected=home. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M07 tạo hobby; M02 xem lịch; M03 Focus; M04 cộng đồng; M14 thông báo. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** Home, không Back nội bộ. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M02 — Lịch trình

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Ngày/tuần/tháng, lịch ngày, trạng thái hoạt động. NavigationBar cố định và content inset108.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Navigation/selected=calendar. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Chọn ngày; M12 mở hoạt động; M10 tạo; M13 tìm; M06 danh sách hobby. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M01 hoặc tab Lịch, Back giữ ngày trước. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M03 — Tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Hobby đang chọn, mode, duration, CTA bắt đầu. NavigationBar cố định và content inset108.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Navigation/selected=focus. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Chọn hobby; M15 cấu hình; M16 bắt đầu; M17 âm thanh; M24 lịch sử. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** Tab Focus hoặc M08/M12, Back về nguồn. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M04 — Cộng đồng

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Feed bài công khai, filter chủ đề và CTA chia sẻ. NavigationBar cố định và content inset108.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Navigation/selected=community. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M34 soạn; M35 đọc; M33 tìm; M27 nhóm; M30 thử thách. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** Tab cộng đồng, Back về nguồn nếu mở từ Home. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M05 — Cá nhân

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Hồ sơ, thống kê, sở thích, cài đặt. NavigationBar cố định và content inset108.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Navigation/selected=profile. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M38 sửa; M39 thành tích; M40 cài đặt; M21 album. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** Tab Cá nhân, không Back nội bộ. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M06 — Danh sách sở thích

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Danh sách hobby, mục tiêu và tiến độ. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M07 thêm; M08 xem; filter ngày/tiến độ. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M01/M02, Back về nguồn. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M07 — Thêm sở thích

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Tên, danh mục, icon, màu, mục tiêu, lịch lặp, mẫu gợi ý. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Tên trim 1–40 ký tự; mục tiêu số dương theo đơn vị; Lưu M08; Hủy xác nhận nếu dirty. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M01/M06 hoặc M35, Back giữ bản nháp theo xác nhận. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M08 — Chi tiết sở thích

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Hobby, tổng giờ, tiến độ 7 ngày và lịch sắp tới. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M09 sửa; M10 đặt lịch; M15 Focus; M34 chia sẻ. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M06/M07/M35, Back về nguồn. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M09 — Chỉnh sửa sở thích

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Form sửa tên, mục tiêu, lịch và thao tác xóa. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Validation như M07; Lưu M08; Xóa cần confirm, không xóa ngầm lịch sử Focus. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M08, Back xác nhận nếu dirty. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M10 — Tạo hoạt động

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Hobby liên quan, tên, ngày, giờ, lặp, nhắc, ghi chú. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Tên 1–80; date hợp lệ; end>start; cảnh báo collision; Save M12; lỗi giữ input. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M08/M02, Back về nguồn, dirty confirm. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M11 — Sửa hoạt động

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Hoạt động đã có và form dời lịch. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Giữ activityId; validation M10; Lưu M12/M02 đúng ngày mới. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M12, Back về M12 khi hủy. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M12 — Chi tiết hoạt động

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tên hoạt động, hobby, ngày/giờ, trạng thái, ghi chú. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M11 sửa; M15 Focus; hoàn thành có phản hồi; xóa/hoàn tác cần confirm. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M10/M02/M13, Back về ngày nguồn. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M13 — Tìm kiếm lịch

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Từ khóa, bộ lọc loại/ngày/trạng thái, kết quả. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Filter; xóa bộ lọc; kết quả M12; empty có đổi từ khóa. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M02, Back giữ query/ngày. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M14 — Thông báo

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Nhắc hoạt động, cộng đồng, trạng thái đã đọc. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M12 mở nhắc lịch; M35 mở bài; M31 mở challenge; retry. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M01/M02, Back về nguồn. Flow F1. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M15 — Thiết lập tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Chọn hobby, mode Pomodoro/countup/custom, thời lượng/nghỉ, tùy chọn âm thanh. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Duration 1–180 phút theo model nguồn; chọn hobby trước start; M16 bắt đầu; M17 chọn nhạc. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M03/M08/M12, Back giữ cấu hình. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M16 — Phiên tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tên hobby, timer, phase và Pause/Resume/Finish. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** ready, running, paused, completed, endedEarly; overlay xác nhận kết thúc; lưu lỗi có retry và chống duplicate.
4. **User interactions:** Ready→Running; Pause giữ elapsed; Resume; Finish overlay; Cancel tiếp tục; Confirm M18. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M15, Back đang chạy phải hỏi tiếp tục/thoát và bảo toàn phiên. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M17 — Âm thanh tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Nguồn âm thanh thiên nhiên và kết nối nền tảng. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Chọn/bỏ âm thanh; M41 kết nối tùy chọn; quay lại phiên không reset. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M15/M16, Back về đúng phiên. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M18 — Tổng kết phiên

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tổng kết elapsed thực, trạng thái hoàn thành/sớm, hobby và tâm trạng. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M19 nhật ký tùy chọn; M24 lịch sử; M01 về Home; không lưu trùng khi Back. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M16, Back về M03/nguồn, không khởi động lại phiên. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M19 — Tạo kỷ niệm

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Tiêu đề, nội dung, ảnh kỷ niệm, hobby/phiên gắn. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Tiêu đề 1–80; ghi chú ≤2000; ảnh tùy chọn; Lưu M22; bỏ qua vẫn giữ session. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M18/M21, Back confirm nếu dirty. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M20 — Sửa kỷ niệm

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Kỷ niệm đã có, ảnh và nội dung chỉnh sửa. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Giữ memoryId; validation M19; Lưu M22; xóa cần confirm. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M22, Back giữ bản gốc. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M21 — Album kỷ niệm

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Album, filter hobby, các kỷ niệm. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M22 mở; M19 tạo; empty có CTA tạo. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M05/M18/M03, Back về nguồn. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M22 — Chi tiết kỷ niệm

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Ảnh, ngày, hobby, ghi chú và session liên quan. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M20 sửa; chia sẻ chỉ nội dung chủ động chọn; không public tự động. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M21/M19, Back về album/nguồn. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M23 — Thống kê tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tổng phút, streak, đồ thị và filter thời gian. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Chọn kỳ/hobby; M24 lịch sử; hiển thị số liệu và nhãn thay chỉ màu. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M03/M08, Back giữ filter. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M24 — Lịch sử tập trung

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Phiên Focus theo ngày, hobby, duration, phase. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Filter; mở thông tin phiên/tổng kết M18 ở read-only; empty CTA Focus. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M03/M18/M23, Back giữ filter. Flow F2. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M25 — Khám phá kiến thức

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Danh mục và bài kiến thức. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Filter và M26 đọc; từ khóa không có kết quả có reset. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04, Back về cộng đồng. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M26 — Chi tiết kiến thức

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Nội dung bài, tác giả, ảnh, thông tin liên quan. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Lưu bài; M25 trở lại; liên kết tới hobby phù hợp. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M25, Back giữ vị trí cuộn. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M27 — Danh sách nhóm

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Các nhóm hobby, tìm/filter và số thành viên. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M28 chi tiết; M33 tìm; empty đổi filter. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M33, Back giữ query. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M28 — Chi tiết nhóm

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tên nhóm, mô tả, số thành viên, bài và CTA join. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Join loading→joined/error; joined CTA không join lại; M29 thảo luận; M30 challenge. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M27/M33, Back giữ trạng thái tham gia. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M29 — Thảo luận

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Nội dung thảo luận, reply và composer. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Reply trim 1–1000; gửi loading/error giữ nháp; quay về nhóm. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M28, Back giữ thread/scroll. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M30 — Danh sách thử thách

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Thử thách, thời hạn, mức độ, tiến độ tham gia. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Filter; M31 mở; M32 xem đang tham gia. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M28, Back về nguồn. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M31 — Chi tiết thử thách

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Cover, thời hạn, mục tiêu, luật, thành viên và CTA join. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Join có xác nhận/feedback; deadline hết không join; M32 theo dõi; đã join không duplicate. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M30/M14, Back về danh sách. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M32 — Theo dõi thử thách

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Ngày của challenge, check-in, tiến độ, nhật ký. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Check-in một lần/ngày theo rule; lỗi giữ trạng thái; M31 luật; mở hobby của tôi nếu liên kết. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M31/M30, Back không mất enrollment. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M33 — Tìm kiếm cộng đồng

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Từ khóa hobby/bài/nhóm, filter và kết quả. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Nhập query; loading→results; no-result reset; bài M35, nhóm M28, challenge M31. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M27, Back giữ query/scroll. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M34 — Tạo bài chia sẻ

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Hobby liên kết, tác giả, visibility, tiêu đề, nội dung, ảnh, preview. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Title trim 1–80, content 1–2000; ảnh tối đa 6 theo UI; preview; publish loading→M35/error; giữ nháp. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M08/M22, Back confirm nếu dirty. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M35 — Chi tiết bài đăng

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Bài công khai, tác giả, hobby, ảnh, like/comment/save. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M36 lưu; thêm hobby M07 giữ thiết lập riêng; comment ≤1000; không sao chép lịch/nhật ký. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M33/M34, Back về nguồn. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M36 — Bài đã lưu

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Bài đã lưu, filter, empty state. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M35 mở; bỏ lưu undo nếu cần; empty CTA khám phá. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M04/M35, Back giữ filter. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M37 — Hồ sơ thành viên

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Hồ sơ công khai thành viên, hobby và bài. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M35 mở bài; dữ liệu public theo quyền đã chọn. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M35/M28, Back về nguồn. Flow F3. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M38 — Sửa hồ sơ

1. **Layout:** Scaffold → SafeArea → AppBar → Form trong SingleChildScrollView với margin16, gap12, section24. Thứ tự nội dung: Avatar, tên, handle và bio. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, TextField/default|focused|filled|error|disabled. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Tên 1–40; handle 3–30; bio ≤200; lưu M05; avatar optional. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M05, Back dirty confirm. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M39 — Thành tích

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Danh sách huy hiệu và tiến độ. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Xem điều kiện; empty khuyến khích hành động; không ép streak khi bỏ ngày. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M05, Back về M05. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M40 — Cài đặt

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Tài khoản, giao diện, notification, privacy và help. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** M41 kết nối; M42 nhắc; M43 riêng tư; M44 help; thao tác destructive confirm. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M05, Back về M05. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M41 — Kết nối nền tảng

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Trạng thái liên kết Spotify/YouTube và dịch vụ. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Connect/disconnect loading,error; bảo toàn Focus; chỉ mô phỏng nếu chưa OAuth thật. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M40/M17, Back về nguồn. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M42 — Cài đặt thông báo

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Lịch nhắc, Focus, cộng đồng, giờ yên lặng. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Toggle lưu; hệ thống từ chối permission thì hướng dẫn setting; rollback lỗi. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M40, Back giữ cài đặt. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M43 — Quyền riêng tư

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Visibility mặc định, dữ liệu và quyền chia sẻ. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading, Dialog/confirm|cancel. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Đổi private/public có mô tả; không đổi hồi tố bài cũ tự động; confirm thao tác dữ liệu. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M40/M34, Back về nguồn. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.

### M44 — Hướng dẫn

1. **Layout:** Scaffold → SafeArea → AppBar → ListView/Column cuộn với margin16, gap12, section24. Thứ tự nội dung: Hướng dẫn Home/lịch/Focus/cộng đồng, hỗ trợ. Nút chính nằm cuối content hoặc SafeArea footer theo nguồn, luôn có đủ padding.
2. **Components:** AppBar/withAction, Card/default, Button/default|pressed|disabled|loading. Loading/skeleton, Empty và Error/Retry dùng khi áp dụng.
3. **States:** default/populated; loading khi tải/lưu; empty khi thiếu dữ liệu; error ghi nguyên nhân và retry; validation gần field cho form.
4. **User interactions:** Tìm câu hỏi; mở mục trợ giúp; quay flow cũ không mất nháp. Đây là quy tắc đích, cần triển khai và kiểm chứng.
5. **Navigation:** M40/M05, Back về nguồn. Flow F1/F2/F3 hỗ trợ chung. State query, ngày chọn, draft và timer phải giữ khi Back phù hợp.
6. **UI constraints:** Vùng chạm≥48dp, body≥14sp. Nội dung ở SafeArea, 360/412dp, tên dài tối đa2 dòng trong list; chi tiết/form cho wrap. Không để menu nổi hoặc bàn phím che CTA. Từ600dp NavigationRail, panel max-width560 cho form hoặc2 cột danh sách/chi tiết; giữ Back về nguồn.
