import 'package:flutter/material.dart';

import '../screens/auth/auth_screens.dart';
import '../screens/main/main_screens.dart';

class AppRoutes {
  AppRoutes._(); // chặn việc tạo instance

  // Tên route
  static const welcome = '/';
  static const login = '/login';
  static const forgotPassword = '/forgot_password';
  static const register = '/register';
  static const passwordResetSuccess = '/password_reset_success';
  static const verifyEmail = '/verify_email';
  static const onboardingGoals = '/onboarding_goals';
  static const onboardingHobbies = '/onboarding_hobbies';
  static const onboardingPermission = '/onboarding_permission';
  static const main = '/main';

  // Bảng route: tên route -> màn hình
  static final Map<String, WidgetBuilder> routes = {
    welcome: (_) => const WelcomeScreen(),
    login: (_) => const Login(),
    forgotPassword: (_) => const ForgotPassword(),
    register: (_) => const Register(),
    passwordResetSuccess: (_) => const PasswordResetSuccess(),
    verifyEmail: (_) => const VerifyEmail(),
    onboardingGoals: (_) => const OnboardingGoals(),
    onboardingHobbies: (_) => const OnboardingHobbies(),
    onboardingPermission: (_) => const OnboardingPermission(),
    main: (_) => const MainScreen(),
  };
}
