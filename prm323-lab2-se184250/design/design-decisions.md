# Quyết định thiết kế và accessibility

Các quyết định bên dưới là lập luận cho bản đích. Trạng thái 'đề xuất' nghĩa là chưa chứng minh đã áp dụng trong file Figma. Không quá 10 quyết định quan trọng.

| ID | Loại | Quyết định | Lý do | Trạng thái/bằng chứng |
|---|---|---|---|---|
| D01 | Accept | Giữ 5 điểm đến Home/Lịch/Focus/Cộng đồng/Cá nhân | Minh chuyển nhanh giữa tác vụ, recognition | Quan sát trong Stitch/Figma |
| D02 | Modify | F1 bắt đầu Home, F2 Focus, F3 Cộng đồng | Bám phạm vi mới người dùng | Đã chuẩn hóa tài liệu, Figma wiring chưa kiểm chứng |
| D03 | Modify | Primary #006A39 và nội dung ≥14sp | Tương phản, đồng nhất token | Brief/handoff đích, chưa sửa Figma |
| D04 | Reject | Xem 5 ZIP như 5 vòng lặp AI | Các gói có màn khác nhau, không có before/after | Không đưa thành bằng chứng lịch sử |
| D05 | Modify | Bổ sung error tại field cho giờ không hợp lệ/trùng | Minh có lịch thay đổi, phòng ngừa lỗi | Đề xuất C07 |
| D06 | Modify | Kết thúc sớm ghi elapsed thực, chống lưu trùng | Phản hồi đúng trạng thái và dữ liệu | Đề xuất C08 |
| D07 | Accept | Nhật ký/âm thanh là tùy chọn | Giảm việc phải làm sau phiên | Quan sát CTA/nội dung, full wiring chưa kiểm chứng |
| D08 | Modify | Sửa M18 chữ chồng, khôi phục ảnh M31/M34 | Ảnh Figma đã thấy lỗi | Đề xuất C05/C06 |
| D09 | Modify | Chuẩn hóa đúng 6 page và khung 360×800 + 412 | Ràng buộc Lab, handoff khả thi | Đề xuất C01, hiện 5 page/390×844 |
| D10 | Reject | Thêm nhiều social feature vào demo chính | Thời gian demo 5 phút, tập trung share/search/join/challenge | Nhánh kiến thức/thảo luận sâu là mở rộng |

## Kết quả tính tương phản token nguồn

Công thức WCAG relative luminance trên sRGB, tỷ lệ (Lmax+0.05)/(Lmin+0.05). Đây là kiểm tra **cặp màu**, không chứng nhận mọi text layer trong Figma.

| Cặp | Foreground | Background | Ratio | Văn bản thường ≥4.5 |
|---|---|---|---:|---|
| onPrimary/primary | #FFFFFF | #006A39 | 6.73:1 | Đạt |
| white/proseAccent | #FFFFFF | #279658 | 3.76:1 | Chưa đạt |
| onSurface/surface | #191C1B | #F9FAF8 | 16.40:1 | Đạt |
| onSurfaceVariant/surface | #3E4A40 | #F9FAF8 | 8.88:1 | Đạt |
| textTertiary/surface | #8E9E93 | #F9FAF8 | 2.69:1 | Chưa đạt |
| white/error | #FFFFFF | #BA1A1A | 6.46:1 | Đạt |
| onSecondaryContainer/secondaryContainer | #157348 | #9EF5BF | 4.55:1 | Đạt |

## Checklist accessibility / responsive

| Yêu cầu | Hiện trạng | Bằng chứng / việc còn lại |
|---|---|---|
| Contrast ≥4.5:1 chữ thường, ≥3:1 chữ lớn/control | Một số token đạt, proseAccent/tertiary có vấn đề | Bảng trên; cần kiểm tra màu thực dùng và trạng thái |
| Tap target ≥48×48dp | Chưa đo tất cả layer | Đo IconButton, chip, ngày lịch và Back trong Figma; không đo kích thước icon thay vùng chạm |
| Nội dung ≥14sp | Nguồn có 11/12/13px | Nâng token, xác minh size thực và text scaling |
| Không chỉ dùng màu | Có text 'Đã hoàn thành', trạng thái timer | Kiểm tra toàn bộ icon/text trạng thái selected, lỗi, tiến độ |
| 360×800dp | Chưa có, current 390×844 | Cần frame reflow đúng đích |
| 412dp | Chưa có bằng chứng test | Cần export và ghi node/kết quả |
| Auto Layout/constraints | Có instance metadata, chưa chứng minh layout toàn bộ | Mở component và Inspect Figma |
| 600dp trở lên | Đã mô tả handoff đích | NavigationRail, max width, 2 panel thích hợp |
| Screen reader/reduced motion | HTML có aria-status và CSS reduced-motion | Không suy ra Figma/Flutter đã hoàn thiện semantics |

Không đánh dấu 'Pass' từ việc nhìn screenshot. Kết quả kiểm thử thực tế cần ngày, người kiểm, node và ảnh tương ứng.
