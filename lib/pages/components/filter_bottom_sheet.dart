import 'package:flutter/material.dart';

import '../../ui_kit/colors.dart';
import '../../ui_kit/text_styles.dart';
import '../../ui_kit/widgets/app_elevated_button.dart';
import '../../utils/constants.dart';
import '../doctors_page.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int selectedType = -1;
  int selectedTime = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E7E7),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categories',
              style: AppStyles.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = index;
                    });
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedType == index ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    duration: AppConstants.duration200,
                    child: Text(
                      categories[index],
                      style: AppStyles.bodySmall.copyWith(fontSize: 14, color: selectedType == index ? AppColors.white : AppColors.black),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Time',
              style: AppStyles.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(times.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = index;
                    });
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedTime == index ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    duration: AppConstants.duration200,
                    child: Text(
                      times[index],
                      style: AppStyles.bodySmall
                          .copyWith(fontSize: 14, color: selectedTime == index ? AppColors.white : AppColors.black),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AppElevatedButton(
              buttonText: 'Apply Filters',
              onTap: () {
                Navigator.of(context).pop();
              }),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 52,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Clear Filters',
                  style: AppStyles.bodySmall,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 12,
          ),
        ],
      ),
    );
  }
}
