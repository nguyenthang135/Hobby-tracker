import 'package:flutter/material.dart';

import '../../widgets/app_bottom_nav.dart';
import 'home/home_screen.dart';
import 'plan/plan_screen.dart';
import 'focus/focus_screen.dart';
import 'profile/profile_screen.dart';
import 'comunity/comunity_screen.dart';

/// Chỉ số tab hiện tại, dùng chung để các màn khác có thể chuyển tab
/// (ví dụ: mainTabIndex.value = 1 để sang tab Plan).
final ValueNotifier<int> mainTabIndex = ValueNotifier(0);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // IndexedStack giữ trạng thái của từng tab khi chuyển qua lại
  static const _tabs = [
    HomeScreen(),
    PlanScreen(),
    FocusScreen(),
    ComunityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: mainTabIndex,
      builder: (context, index, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FBF7),
          body: IndexedStack(index: index, children: _tabs),
          bottomNavigationBar: AppBottomNav(
            currentIndex: index,
            onTap: (i) => mainTabIndex.value = i,
          ),
        );
      },
    );
  }
}
