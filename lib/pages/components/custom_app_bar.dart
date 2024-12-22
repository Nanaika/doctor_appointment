import 'package:flutter/material.dart';

import '../../ui_kit/colors.dart';
import '../../ui_kit/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, this.onBack, this.textColor = AppColors.black,
  });
  final String title;
  final Color textColor;
  final void Function()? onBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Expanded(
            child: Text(
              title,
              style: AppStyles.displayMedium.copyWith(color: textColor),
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          width: 45,
        ),
      ],
    );
  }
}