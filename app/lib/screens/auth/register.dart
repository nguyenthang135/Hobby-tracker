import 'package:flutter/material.dart';

import '../../widgets/custom_field.dart';
import '../../widgets/app_button.dart';
import '../../widgets/links.dart';
import '../../routes/app_routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isTermsAccepted = false;

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
              const RegisterHero(),

              const Text(
                'Create account',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF131E1C),
                ),
              ),

              const CustomField(label: 'Name', hintText: 'Enter your name'),

              const CustomField(label: 'Email', hintText: 'Enter your email'),

              const CustomField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TermsCheckbox(
                isChecked: isTermsAccepted,
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Create account',
                onPressed: isTermsAccepted
                    ? () {
                        // TODO: Xử lý đăng ký tại đây
                        debugPrint('Create account');
                      }
                    : null,
              ),
              const SizedBox(height: 16),
              const Links(
                text: 'Already have an account? Log in',
                route: AppRoutes.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterHero extends StatelessWidget {
  const RegisterHero({super.key});

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
            'Make room for you',
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
            'Start your hobby journey in a few minutes.',
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

class TermsCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const TermsCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9CE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 17,
            height: 17,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) => onChanged(value ?? false),
              activeColor: const Color(0xFF0E8D68),
              checkColor: Colors.white,
              side: const BorderSide(color: Color(0xFF131E1C), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Text(
              'I agree to the Terms and Privacy Policy',
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.3,
                color: Color(0xFF131E1C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
