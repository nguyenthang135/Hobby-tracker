import 'package:flutter/material.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const FetchTimerApp());
}

class FetchTimerApp extends StatelessWidget {
  const FetchTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Timer',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FBF7),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
    );
  }
}
