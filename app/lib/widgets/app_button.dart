import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class StartFocusButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const StartFocusButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: context.h(52),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0E8D68),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF0E8D68),
          disabledForegroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
