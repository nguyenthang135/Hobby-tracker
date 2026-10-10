import 'package:flutter/material.dart';

import '../../utils/responsive.dart'; // đổi đường dẫn cho đúng dự án của bạn
import '../../widgets/app_button.dart';
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        child: Padding(
          // padding: 22 / 24 / 18 / 24 (top / right / bottom / left)
          padding: EdgeInsets.fromLTRB(
            context.w(24),
            context.h(22),
            context.w(24),
            context.h(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeIllustration(),
              SizedBox(height: context.h(16)),
              Text(
                'More time for you',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: context.sp(28),
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: const Color(0xFF131E1C),
                ),
              ),
              SizedBox(height: context.h(16)),
              Text(
                'Plan hobbies and focus without pressure.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: context.sp(15),
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: const Color(0xFF5A6D67),
                ),
              ),
              SizedBox(height: context.h(16)),
              const OnboardingSteps(),
              SizedBox(height: context.h(16)),
              StartFocusButton(
                text: 'Start your journey',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
              SizedBox(height: context.h(16)),
              Text(
                'You can adjust notifications and privacy anytime.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: context.sp(12),
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: 0,
                  color: const Color(0xFF5A6D67),
                ),
              ),
              // Thêm các thành phần từ Figma tại đây
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.h(220),
      padding: EdgeInsets.all(context.r(24)),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(context.r(32)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Peach circle (dùng r() để luôn là hình tròn)
          Container(
            width: context.r(116),
            height: context.r(116),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE9CE),
              shape: BoxShape.circle,
            ),
          ),

          SizedBox(height: context.h(8)),

          // Title
          Text(
            'Make space for what you love',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: context.sp(18),
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: const Color(0xFF131E1C),
            ),
          ),

          SizedBox(height: context.h(4)),

          // Subtitle
          Text(
            'Plan hobbies, focus, and save moments.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: context.sp(13),
              fontWeight: FontWeight.w400,
              height: 1.3,
              color: const Color(0xFF5A6D67),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingSteps extends StatelessWidget {
  const OnboardingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.h(153),
      padding: EdgeInsets.all(context.r(14)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _OnboardingStep(
            number: '1',
            title: 'Choose your hobbies',
            description: 'Photography, reading, drawing…',
          ),
          SizedBox(height: context.h(10)),
          const _OnboardingStep(
            number: '2',
            title: 'Make time to focus',
            description: 'Build a little time for yourself.',
          ),
          SizedBox(height: context.h(10)),
          const _OnboardingStep(
            number: '3',
            title: 'Save your moments',
            description: 'Keep track of what you love.',
          ),
        ],
      ),
    );
  }
}

class _OnboardingStep extends StatelessWidget {
  const _OnboardingStep({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Step number
          Container(
            width: context.w(25),
            height: context.h(35),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFD6F2E5),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              number,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: context.sp(13),
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xFF0E8D68),
              ),
            ),
          ),

          SizedBox(width: context.w(10)),

          // Step copy
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: const Color(0xFF131E1C),
                  ),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: context.sp(12),
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    color: const Color(0xFF5A6D67),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
