import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isActive = true,
  });

  final String buttonText;
  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: AppConstants.duration200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? AppColors.primary : AppColors.primary.withOpacity(0.5),
        ),
        height: 52,
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: AppStyles.bodyMedium.apply(
              color: isActive ? AppColors.white : AppColors.white.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
