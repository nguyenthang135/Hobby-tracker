import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Khung thiết kế chuẩn (Figma): 390 x 844.
class DesignFrame {
  static const double width = 390;
  static const double height = 844;
}

/// Quy đổi kích thước Figma (px) sang kích thước thực theo màn hình.
///
/// Dùng:
///   context.w(24)  -> theo chiều ngang (padding trái/phải, width)
///   context.h(22)  -> theo chiều dọc (padding trên/dưới, height, gap dọc)
///   context.r(16)  -> theo tỉ lệ nhỏ nhất (bo góc, hình tròn, icon)
///   context.sp(28) -> cỡ chữ
extension ResponsiveContext on BuildContext {
  Size get _screen => MediaQuery.sizeOf(this);

  double get _sw => _screen.width / DesignFrame.width;
  double get _sh => _screen.height / DesignFrame.height;
  double get _sMin => math.min(_sw, _sh);

  double w(double value) => value * _sw;

  double h(double value) => value * _sh;

  double r(double value) => value * _sMin;

  /// Cỡ chữ: không bao giờ lớn hơn tỉ lệ chiều cao (tránh overflow
  /// ở các khối có height cố định) và giới hạn tối đa 1.3x cho tablet.
  double sp(double value) => value * _sMin.clamp(0.0, 1.3);
}
