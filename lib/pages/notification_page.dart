import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final notificationColors = [
  AppColors.primary,
  AppColors.lightOrange,
  AppColors.lightViolet,
  AppColors.primary,
  AppColors.lightViolet,
  AppColors.lightOrange,
];

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: 'Notification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Today - 20 Sep, 2020',
                style: AppStyles.bodyMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: List<Widget>.generate(5, (index) {
                  if (index.isOdd) {
                    return const SizedBox(
                      height: 25,
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: notificationColors[index ~/ 2].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.notification,
                            colorFilter: ColorFilter.mode(notificationColors[index ~/ 2], BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your have appointment with mahbuba islam at 9:00 pm today',
                                style: AppStyles.bodySmall.copyWith(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '25 Minutes ago',
                                style: AppStyles.labelMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                '19 Sep, 2020',
                style: AppStyles.bodyMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: List<Widget>.generate(11, (index) {
                  if (index.isOdd) {
                    return const SizedBox(
                      height: 25,
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: notificationColors[index ~/ 2].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.notification,
                            colorFilter: ColorFilter.mode(notificationColors[index ~/ 2], BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your have appointment with mahbuba islam at 9:00 pm today',
                                style: AppStyles.bodySmall.copyWith(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '25 Minutes ago',
                                style: AppStyles.labelMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 12 + MediaQuery.of(context).padding.bottom + 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
