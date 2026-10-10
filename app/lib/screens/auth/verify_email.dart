import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/responsive.dart'; // đổi đường dẫn cho đúng dự án của bạn
import '../../widgets/app_button.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
              const VerifyHero(),
              SizedBox(height: context.h(16)),
              Text(
                'Enter verification code',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: context.sp(15),
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: 0,
                  color: const Color(0xFF131E1C),
                ),
              ),
              SizedBox(height: context.h(8)),
              OTPInput(
                onCompleted: (code) {
                  debugPrint('OTP: $code');
                },
              ),
              SizedBox(height: context.h(16)),
              StartFocusButton(
                text: 'Verify Email',
                onPressed: () {
                  Navigator.pushNamed(context, '/password_reset_success');
                },
              ),
              SizedBox(height: context.h(16)),
              const ResendCode(),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyHero extends StatelessWidget {
  const VerifyHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 342 = 390 - 24*2 -> chiếm trọn bề ngang còn lại sau padding
      width: double.infinity,
      height: context.h(190),
      padding: EdgeInsets.all(context.r(28)),
      decoration: BoxDecoration(
        color: const Color(0xFFD6F2E5),
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '✉',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: context.sp(40),
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: const Color(0xFF0E8D68),
            ),
          ),
          SizedBox(height: context.h(18)),
          Text(
            'Check your inbox',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: context.sp(22),
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: const Color(0xFF131E1C),
            ),
          ),
          SizedBox(height: context.h(2)),
          Text(
            'We sent a 6-digit code to minh****@email.com',
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

class OTPInput extends StatefulWidget {
  final ValueChanged<String>? onCompleted;

  const OTPInput({super.key, this.onCompleted});

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  final int otpLength = 6;

  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(otpLength, (_) => TextEditingController());

    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void onDigitChanged(String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    final otp = controllers.map((c) => c.text).join();

    // Lưu ý: bản gốc có thêm điều kiện `!otp.contains('')` -> luôn false
    // (vì mọi chuỗi đều "chứa" chuỗi rỗng) nên onCompleted không bao giờ chạy.
    if (otp.length == otpLength) {
      widget.onCompleted?.call(otp);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(otpLength, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index == otpLength - 1 ? 0 : context.w(8),
          ),
          child: SizedBox(
            width: context.w(41),
            height: context.h(51),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: context.sp(18),
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: const Color(0xFF0E8D68),
              ),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.r(14)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.r(14)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.r(14)),
                  borderSide: const BorderSide(
                    color: Color(0xFF0E8D68),
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: (value) => onDigitChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  int secondsRemaining = 60;

  @override
  Widget build(BuildContext context) {
    final minutes = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining % 60).toString().padLeft(2, '0');

    return GestureDetector(
      onTap: secondsRemaining == 0
          ? () {
              setState(() {
                secondsRemaining = 42;
              });
              // TODO: Gọi chức năng gửi lại mã OTP
            }
          : null,
      child: Text(
        secondsRemaining > 0
            ? 'Resend code in $minutes:$seconds'
            : 'Resend code',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: context.sp(13),
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: 0,
          color: const Color(0xFF0E8D68),
        ),
      ),
    );
  }
}
