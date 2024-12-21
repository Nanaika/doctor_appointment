import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui_kit/colors.dart';
import '../../ui_kit/text_styles.dart';
import '../../utils/assets_paths.dart';

class DoctorTile extends StatelessWidget {
  const DoctorTile({
    super.key, this.onPlusTap,
  });
  final void Function()? onPlusTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 62,
            height: 62,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -2,
                  child: Image.asset(
                    AppImages.doc,
                    width: 62,
                    height: 62,
                  ),
                ),
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF209F85),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Dr. Kawsar Ahmed',
                  style: AppStyles.displayLarge.copyWith(fontSize: 16),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Cardiologist - ',
                    style: AppStyles.bodySmall.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF979797),
                    ),
                    children: [
                      TextSpan(
                        text: 'Cumilla Madical Collage',
                        style: AppStyles.bodySmall.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF979797),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    '10:20 AM - 12:30 PM',
                    style: AppStyles.labelMedium.copyWith(fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onPlusTap,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
              child: const Icon(
                CupertinoIcons.add,
                size: 12,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}