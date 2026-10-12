# Design brief chuẩn hóa — Fetch Timer

Nguồn: DESIGN.md từ Stitch được lưu nguyên vẹn ở [DESIGN-stitch-original.md](DESIGN-stitch-original.md). Đây là brief đích đề xuất cho vòng hoàn thiện, không phải prompt lịch sử đã gửi Stitch.

## Phạm vi và phong cách

Mobile-first, UI tiếng Việt, Premium Light / Organic Softness. Nền sáng ấm, xanh lá cho hành động chính, pastel phân nhóm. Một hệ AppBar/Navigation thống nhất trên 5 điểm đến. 44 màn hiện có, ưu tiên 3 flow F1/F2/F3. Nội dung cốt lõi từ 14sp. Không tăng trang trí làm giảm khả năng đọc hoặc che CTA.

## Token màu chuẩn hóa

YAML gốc đặt primary #006A39 nhưng mô tả prose ghi #279658. Chọn #006A39 làm primary đích vì cặp chữ trắng có tương phản tốt hơn. Không coi việc sửa brief là đã sửa component Figma.

| Token | HEX | Vai trò | Flutter dự kiến |
|---|---|---|---|
| primary | #006A39 | CTA/selected | ColorScheme.primary |
| onPrimary | #FFFFFF | Chữ trên primary | ColorScheme.onPrimary |
| surface | #F9FAF8 | Nền app | ColorScheme.surface |
| surfaceContainerLowest | #FFFFFF | Nền card | ColorScheme.surfaceContainerLowest |
| onSurface | #191C1B | Chữ chính | ColorScheme.onSurface |
| onSurfaceVariant | #3E4A40 | Chữ mô tả | ColorScheme.onSurfaceVariant |
| outline | #6E7A6F | Viền/input | ColorScheme.outline |
| outlineVariant | #BDCABD | Viền mềm | ColorScheme.outlineVariant |
| secondaryContainer | #9EF5BF | Nền hỗ trợ | ColorScheme.secondaryContainer |
| onSecondaryContainer | #157348 | Chữ trên nền hỗ trợ | ColorScheme.onSecondaryContainer |
| error | #BA1A1A | Lỗi | ColorScheme.error |
| onError | #FFFFFF | Chữ trên error | ColorScheme.onError |
| errorContainer | #FFDAD6 | Nền lỗi | ColorScheme.errorContainer |
| onErrorContainer | #93000A | Chữ trên nền lỗi | ColorScheme.onErrorContainer |
| categoryGreen | #E8F6ED | Danh mục xanh | AppColors.categoryGreen |
| categoryPurple | #F1EAFC | Sáng tạo | AppColors.categoryPurple |
| categoryYellow | #FFF4DC | Lưu ý | AppColors.categoryYellow |
| categoryBlue | #E8F2FF | Lịch/nhắc | AppColors.categoryBlue |

Các token mở rộng/inverse/fixed trong DESIGN-stitch-original.md giữ cho traceability. Không yêu cầu lập trình viên dùng tất cả nếu không có UI tương ứng. Không mã hóa trạng thái chỉ bằng màu.

## Typography đích

Inter, hỗ trợ tiếng Việt. Token 11/12/13px gốc được giữ trong nguồn nhưng nâng lên ≥14sp ở nhãn/nội dung cần đọc theo đề.

| Token | Size/weight | Line height | Flutter |
|---|---|---|---|
| headlineXL | 28sp / 700 | 36sp | TextTheme.headlineSmall |
| headlineLG | 22sp / 600 | 28sp | TextTheme.titleLarge |
| headlineMD | 18sp / 600 | 24sp | TextTheme.titleMedium |
| titleSM | 16sp / 600 | 22sp | TextTheme.titleSmall |
| bodyLG | 16sp / 400 | 24sp | TextTheme.bodyLarge |
| bodyMD | 14sp / 400 | 20sp | TextTheme.bodyMedium |
| labelMD | 14sp / 600 | 20sp | TextTheme.labelLarge |
| captionReadable | 14sp / 500 | 20sp | TextTheme.bodySmall |

## Spacing, radius, elevation

| Token | Giá trị dp | Flutter |
|---|---:|---|
| spaceXS | 4 | AppSpacing.xs |
| spaceSM | 8 | AppSpacing.sm |
| spaceMD / gutter | 12 | AppSpacing.md / gutter |
| spaceLG / margin | 16 | AppSpacing.lg / margin |
| spaceXL | 24 | AppSpacing.xl |
| radiusSM | 4 | AppRadius.sm |
| radiusDefault | 8 | AppRadius.base |
| radiusMD | 12 | AppRadius.md |
| radiusLG | 16 | AppRadius.lg |
| radiusXL | 24 | AppRadius.xl |
| radiusFull | 9999 | AppRadius.pill |
| touchMinimum | 48 | AppDimensions.minTap |
| contentBottomInset | 108 | AppDimensions.bottomContentInset |
| elevationFlat | 0 | AppElevation.flat |
| elevationRaised | 2 | AppElevation.raised |
| elevationOverlay | 8 | AppElevation.overlay |

Prose gốc đề cập Card radius 19px, YAML dùng bậc 4/8/12/16/24. Chuẩn hóa card đích về radiusLG 16 để component và handoff có một giá trị. Elevation Flutter là mức đích đề xuất; CSS shadow gốc không chuyển một-một thành elevation.

## Chín nhóm component và states bắt buộc

| Component | Variant/state |
|---|---|
| Button | default, pressed, disabled, loading |
| TextField | default, focused, filled, error, disabled |
| Card | default, pressed nếu bấm được |
| Navigation | selected=home/calendar/focus/community/profile |
| AppBar | default, withAction |
| Dialog | confirm, cancel/error |
| Loading | screenSpinner hoặc skeleton |
| Empty | icon + message + action |
| Error | reason + retry |

Component cần Auto Layout, tokens Variables/styles và màn hình dùng instance. Không coi symbol cấp màn hình trong metadata là đủ bằng chứng 9 nhóm này.

## Layout

Đích Lab 360×800dp, bổ sung kiểm tra 412dp. Hiện Figma/HTML 390×844, cần dựng constraints đúng kích thước đích. Nội dung cuộn dọc; AppBar/Navigation nằm ngoài nội dung cuộn. Dùng SafeArea, keyboard inset, bottom inset 108dp khi menu nổi. Từ 600dp: NavigationRail, panel danh sách/chi tiết nếu phù hợp, form max width 560dp, giữ luồng và chữ dễ đọc. Không chỉ scale nhỏ toàn bộ hình.
