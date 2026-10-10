import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback? onActionTap;

  const OnboardingHeader({
    super.key,
    this.title = 'Reset password',
    this.subtitle = 'We’ll help you get back in.',
    this.actionText = '‹',
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF131E1C),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
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

        GestureDetector(
          onTap: onActionTap,
          child: Container(
            constraints: const BoxConstraints(minWidth: 24, minHeight: 37),
            padding: const EdgeInsets.symmetric(horizontal: 9),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFD6F2E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              actionText,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.3,
                letterSpacing: 0,
                color: Color(0xFF0E8D68),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
