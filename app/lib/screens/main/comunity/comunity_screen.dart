import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

class ComunityScreen extends StatelessWidget {
  const ComunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            context.w(24),
            context.h(22),
            context.w(24),
            context.h(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
