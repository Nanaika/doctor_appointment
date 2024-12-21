import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.splashBack,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Image.asset(AppImages.logo),
        ),
      ],
    );
  }
}
