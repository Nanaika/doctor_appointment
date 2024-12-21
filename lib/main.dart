import 'package:doctor_appoinment/navigation/main_categories_page.dart';
import 'package:doctor_appoinment/pages/forgot_password_page.dart';
import 'package:doctor_appoinment/pages/login_page.dart';
import 'package:doctor_appoinment/pages/main_page.dart';
import 'package:doctor_appoinment/pages/sign_up_page.dart';
import 'package:doctor_appoinment/pages/splash_page.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigation/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(1, 1, 1, 1),
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          selectionColor: AppColors.primary,
          cursorColor: AppColors.primary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backGround,
          scrolledUnderElevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.backGround,
        useMaterial3: true,
      ),
      onUnknownRoute: (settings) => CupertinoPageRoute(
        builder: (context) => const SplashPage(),
      ),
      onGenerateRoute: (settings) => switch (settings.name) {
        AppRoutes.splash => CupertinoPageRoute(
            settings: settings,
            builder: (context) => const SplashPage(),
          ),
        AppRoutes.login => CupertinoPageRoute(
            settings: settings,
            builder: (context) => const LoginPage(),
          ),
        AppRoutes.signUp => CupertinoPageRoute(
          settings: settings,
          builder: (context) => const SignUpPage(),
        ),
        AppRoutes.forgotPass => CupertinoPageRoute(
          settings: settings,
          builder: (context) => const ForgotPasswordPage(),
        ),
        AppRoutes.mainCategories => CupertinoPageRoute(
          settings: settings,
          builder: (context) => const MainCategoriesPage(),
        ),
        AppRoutes.main => CupertinoPageRoute(
          settings: settings,
          builder: (context) => const MainPage(),
        ),
        _ => null,
      },
      home: const LoginPage(),
    );
  }
}
