import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../plan/plan_screen.dart';

// Style dùng chung, cỡ chữ đã scale
TextStyle _style(
  BuildContext context, {
  required double size,
  required FontWeight weight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: context.sp(size),
    fontWeight: weight,
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );
}

const _ink = Color(0xFF131E1C);
const _muted = Color(0xFF5A6D67);
const _green = Color(0xFF0E8D68);
const _mint = Color(0xFFD6F2E5);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            context.w(24),
            context.h(22),
            context.w(24),
            context.h(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlanHeader(
                name: 'Minh Anh',
                date: 'Make time for the things you love.',
              ),
              const SizedBox(height: 16),
              ProfileCard(
                name: 'Minh Anh',
                username: '@minhanh',
                hobbies: '4 hobbies',
                onEditTap: () {
                  // Xử lý khi người dùng nhấn vào "Edit profile"
                  debugPrint('Edit profile tapped');
                },
              ),
              const SizedBox(height: 16),
              const ProfileStats(
                stats: [
                  ProfileStatItem(value: '12', label: 'Sessions'),
                  ProfileStatItem(value: '8h', label: 'Time'),
                  ProfileStatItem(value: '6', label: 'Moments'),
                ],
              ),
              const SizedBox(height: 16),
              AccountSection(
                onNotificationsTap: () {
                  // Xử lý khi người dùng nhấn vào "Notifications"
                  debugPrint('Notifications tapped');
                },
                onPrivacyTap: () {
                  // Xử lý khi người dùng nhấn vào "Privacy & safety"
                  debugPrint('Privacy & safety tapped');
                },
                onAccessibilityTap: () {
                  // Xử lý khi người dùng nhấn vào "Accessibility"
                  debugPrint('Accessibility tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String username;
  final String hobbies;
  final VoidCallback? onEditTap;

  const ProfileCard({
    super.key,
    this.name = 'Minh Anh',
    this.username = '@minhanh',
    this.hobbies = '4 hobbies',
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 113,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Avatar + Profile details
          Expanded(
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFE9CE),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF5A6D67),
                  ),
                ),

                const SizedBox(width: 12),

                // Profile details
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          letterSpacing: 0,
                          color: Color(0xFF131E1C),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$username · $hobbies',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: 0,
                          color: Color(0xFF5A6D67),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Edit profile
          GestureDetector(
            onTap: onEditTap,
            child: const Text(
              'Edit profile →',
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: 0,
                color: Color(0xFF0E8D68),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  final List<ProfileStatItem> stats;

  const ProfileStats({
    super.key,
    this.stats = const [
      ProfileStatItem(value: '12', label: 'Sessions'),
      ProfileStatItem(value: '8', label: 'Hours'),
      ProfileStatItem(value: '5', label: 'Streak'),
    ],
  });

  @override
  Widget build(BuildContext context) {
    final items = stats.take(3).toList();

    return Row(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          Expanded(
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    items[i].value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      color: Color(0xFF131E1C),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    items[i].label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      color: Color(0xFF5A6D67),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (i < items.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class ProfileStatItem {
  final String value;
  final String label;

  const ProfileStatItem({required this.value, required this.label});
}

class AccountSection extends StatelessWidget {
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onAccessibilityTap;

  const AccountSection({
    super.key,
    this.onNotificationsTap,
    this.onPrivacyTap,
    this.onAccessibilityTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 96,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAccountItem(title: 'Notifications', onTap: onNotificationsTap),
          _buildAccountItem(title: 'Privacy & safety', onTap: onPrivacyTap),
          _buildAccountItem(title: 'Accessibility', onTap: onAccessibilityTap),
        ],
      ),
    );
  }

  Widget _buildAccountItem({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 18,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF131E1C),
            ),
          ),
        ),
      ),
    );
  }
}
