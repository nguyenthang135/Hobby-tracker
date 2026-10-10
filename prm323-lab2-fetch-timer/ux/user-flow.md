# Information architecture & user flows

```text
Home (S01)
├─ Lịch trình (S03) ─ Chi tiết hoạt động (S04)
│                      └─ Thiết lập focus (S05)
├─ Tạo hoạt động (S02) ─ Lịch trình (S03)
├─ Focus (S05) ─ Đồng hồ (S06) ─ Loading (state) ─ Tổng kết (S07)
├─ Cộng đồng (S08) ─ Chi tiết nhóm (S09) ─ Dialog tham gia (overlay)
└─ Hồ sơ (S10)
```

## F01 — Lên lịch sở thích
S01 → S02 → kiểm tra tên → S03 → S04. Nếu tên trống, S02 hiển thị inline error, vẫn giữ dữ liệu và cho nhập lại. Back từ S04 về S03.

## F02 — Focus
S01 → S05 (chọn 15/25/45 phút) → S06 (start/pause) → Loading → S07 → S01. Nhánh khác: chọn "Kết thúc sớm" → overlay; "Tiếp tục" đóng overlay, "Kết thúc" → S05.

## F03 — Cộng đồng
S01 → S08 → S09 → dialog xác nhận → S09 đã tham gia. Nhánh khác: Hủy → S09 chưa tham gia. Back từ S09 → S08.

| Flow | Screens chính | States phụ |
|---|---|---|
| F01 | S01 S02 S03 S04 | Validation error / saved toast |
| F02 | S01 S05 S06 S07 | Paused / quit dialog / loading |
| F03 | S01 S08 S09 | Join dialog / joined state |

10 màn hình độc lập, dialog/loading/validation là state, không cộng vào số màn hình.
