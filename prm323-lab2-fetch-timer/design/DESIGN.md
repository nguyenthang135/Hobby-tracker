# Fetch Timer Design System (reference spec)

## Tính cách sản phẩm
Calm, focused, friendly, premium-light. Giao diện rõ ràng với một CTA chính trên màn, thanh bottom navigation 4 mục; ưu tiên sự đơn giản cho người bận rộn.

## Colors (hex)
- `primary`: #0E8D68
- `primary-light`: #D6F2E5
- `ink`: #131E1C
- `secondary-text`: #5A6D67
- `background`: #F8FBF7
- `surface`: #FFFFFF
- `border`: #DFE8E3
- `success-bg`: #DFF9E9
- `success-text`: #146A45
- `warning-bg`: #FFF0E2
- `warning-text`: #B4561E

## Typography
- Font: Inter (Figma Light UI); Noto Sans for companion HTML prototype
- Display 28 / 34, weight 850; H2 20 / 26, bold; H3 15 / 22, bold; body 15 / 22; form labels 14 / 20; chú thích 12–13 / 18 (phải tăng lên >=14 khi đưa vào Flutter theo chuẩn bài lab).

## Scale / layout
- spacing: 4, 8, 12, 16, 20, 24, 32 dp; outer mobile padding 20–21 dp.
- radius: 12 (chip/button small), 15 (field/action), 18 (card), 24–28 (hero/dialog).
- elevation: subtle shadow 0 12 30 rgba(29,37,71,0.07).
- platform: mobile Android/iOS, Figma base 360×800 dp, test 412 dp; scrollable content; bottom navigation fixed.

## Components / variants cần dựng Figma
1. Button: default, pressed, disabled, loading
2. Text field: default, focused, filled, error, disabled
3. Card: default, pressed
4. Navigation: Home/Schedule/Community/Profile active state
5. App bar: default/action
6. Dialog: confirmation/cancel/error
7. Loading: screen spinner/skeleton
8. Empty: illustration/description/action
9. Error: explanation/retry

## Accessibility
Bảo đảm text thường >=4.5:1, text lớn và UI indicator >=3:1, touch target >=48×48dp, body text >=14sp, keyboard and screenreader semantics, không chỉ biểu đạt ý nghĩa bằng màu. Trong HTML demo một số metadata hiện đang 12–13px nên cần chuẩn hóa khi dựng Figma/Flutter.
