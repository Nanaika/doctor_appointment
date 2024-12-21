import 'package:doctor_appoinment/navigation/routes.dart';
import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';

class MainCategoriesPage extends StatelessWidget {
  const MainCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const CustomAppBar(title: 'Departments / Categories'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'What do you want to Consult you like',
                            style: AppStyles.displayLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) {
                                if (index % 2 != 0) {
                                  return const SizedBox(
                                    width: 16,
                                  );
                                }
                                return Column(
                                  children: List.generate(7, (innerIndex) {
                                    if (innerIndex % 2 != 0) {
                                      return const SizedBox(
                                        height: 16,
                                      );
                                    }
                                    return SizedBox(
                                      width: (MediaQuery.of(context).size.width - 50 - 16) / 2,
                                      child: Image.asset(
                                        AppImages.categories[(index ~/ 2) + innerIndex],
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).padding.bottom + 52 + 24,),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: MediaQuery.of(context).padding.bottom,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
                      child: AppElevatedButton(buttonText: 'Continue', onTap: () {
                                Navigator.of(context).pushNamed(AppRoutes.main);
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
