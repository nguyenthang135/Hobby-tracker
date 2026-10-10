import 'package:flutter/material.dart';

import '../../widgets/custom_field.dart';
import '../../widgets/app_button.dart';
import '../../widgets/links.dart';
import '../../routes/app_routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              ForgotPasswordHeader(
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
              const RecoveryHero(),
              const CustomField(label: 'Email', hintText: 'Enter your email'),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Send reset link',
                onPressed: () {
                  Navigator.pushNamed(context, '/verify_email');
                },
              ),
              const SizedBox(height: 16),
              const Links(
                text: 'Remembered your password? Log in',
                route: AppRoutes.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordHeader extends StatelessWidget {
  final VoidCallback onBack;

  const ForgotPasswordHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Reset password',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF131E1C),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'We’ll help you get back in.',
                style: TextStyle(
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
          onTap: onBack,
          child: Container(
            width: 24,
            height: 37,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFD6F2E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              '‹',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: Color(0xFF0E8D68),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecoveryHero extends StatelessWidget {
  const RecoveryHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reset with ease',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: Color(0xFF131E1C),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Enter your email and we’ll send a reset link.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.3,
              color: Color(0xFF5A6D67),
            ),
          ),
        ],
      ),
    );
  }
}
