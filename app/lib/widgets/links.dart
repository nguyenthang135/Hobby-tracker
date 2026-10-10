import 'package:flutter/material.dart';

class Links extends StatelessWidget {
  final String text;
  final String route;

  const Links({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: 0,
          color: Color(0xFF0E8D68),
        ),
      ),
    );
  }
}
