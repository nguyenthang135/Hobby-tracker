import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../../widgets/onboarding_header.dart';
import '../../widgets/links.dart';
import '../../routes/app_routes.dart';
import '../main/main_screen.dart';

class OnboardingPermission extends StatefulWidget {
  const OnboardingPermission({super.key});

  @override
  State<OnboardingPermission> createState() => _OnboardingPermissionState();
}

class _OnboardingPermissionState extends State<OnboardingPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingHeader(
                title: 'Stay in the loop',
                subtitle: 'Step 3 of 3',
                actionText: '3/3',
                onActionTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
              const ReminderPermission(),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Allow notifications',
                onPressed: () {
                  // TODO: kiểm tra email/mật khẩu ở đây (validate, gọi API...)
                  mainTabIndex.value = 0; // luôn mở tab Home
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.main,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Links(
                text: 'Not now · You can enable this in Settings.',
                route: AppRoutes.main,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReminderPermission extends StatelessWidget {
  final String title;
  final String description;

  const ReminderPermission({
    super.key,
    this.title = 'Gentle reminders',
    this.description = 'We’ll remind you before sessions you plan.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 149,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '◷',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF0E8D68),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF131E1C),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
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
    );
  }
}
