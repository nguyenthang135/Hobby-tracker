import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';

class PasswordResetSuccess extends StatefulWidget {
  const PasswordResetSuccess({super.key});

  @override
  State<PasswordResetSuccess> createState() => _PasswordResetSuccessState();
}

class _PasswordResetSuccessState extends State<PasswordResetSuccess> {
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
              const SuccessHero(),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Go to Login',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessHero extends StatelessWidget {
  const SuccessHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 190,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '✓',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: Color(0xFF0E8D68),
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Password updated',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: Color(0xFF131E1C),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'You can log in with your new password.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
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
