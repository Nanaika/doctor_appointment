import 'package:flutter/material.dart';

import '../../ui_kit/colors.dart';
import '../../ui_kit/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title, this.onBack,
  });
  final String title;
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
              style: AppStyles.displayMedium,
              textAlign: TextAlign.center,
            )),
        const SizedBox(
          width: 45,
        ),
      ],
    );
  }
}