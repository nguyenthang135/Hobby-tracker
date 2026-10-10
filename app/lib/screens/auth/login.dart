import 'package:flutter/material.dart';

import '../../widgets/custom_field.dart';
import '../../widgets/app_button.dart';
import '../../widgets/links.dart';
import '../../routes/app_routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              LoginHero(),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF131E1C),
                ),
              ),
              CustomField(label: 'Email', hintText: 'Enter your email'),
              CustomField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              SizedBox(height: 16),
              StartFocusButton(
                text: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding_hobbies');
                },
              ),
              SizedBox(height: 16),
              GoogleSignInButton(),
              SizedBox(height: 16),
              const Links(
                text: 'Forgot password?',
                route: AppRoutes.forgotPassword,
              ),
              const Links(text: 'Create account', route: AppRoutes.register),
              // Thêm các component Login tại đây
            ],
          ),
        ),
      ),
    );
  }
}

class LoginHero extends StatelessWidget {
  const LoginHero({super.key});

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
            'Fetch Timer',
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
            'A calm home for your hobbies.',
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

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: () {
          debugPrint('Continue with Google');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFFFFF),
          foregroundColor: const Color(0xFF131E1C),
          elevation: 0,
          padding: const EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          'Continue with Google',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.3,
            letterSpacing: 0,
            color: Color(0xFF131E1C),
          ),
        ),
      ),
    );
  }
}
