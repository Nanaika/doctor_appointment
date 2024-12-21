import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_text_form_field.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui_kit/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 3) {
      _currentPage++;
      pageController.nextPage(duration: AppConstants.duration200, curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _currentPage--;
      pageController.previousPage(duration: AppConstants.duration200, curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: CustomAppBar(
                  title: 'Forgot Password',
                  onBack: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'We need your registration phon number to send you password reset code!',
                          style: AppStyles.bodyMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 74,
                      ),
                      AppTextFormField(hint: 'email', onChanged: (text) {}),
                      const SizedBox(
                        height: 18,
                      ),
                      AppElevatedButton(
                          buttonText: 'Send Code',
                          onTap: () {
                            _nextPage();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: CustomAppBar(
                  title: 'Verification Code',
                  onBack: () {
                    _prevPage();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter the code we sent you',
                          style: AppStyles.bodyMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 95,
                      ),
                      Row(
                        children: List.generate(9, (index) {
                          if (index.isOdd) {
                            return const SizedBox(
                              width: 16,
                            );
                          }
                          return Container(
                            width: (MediaQuery.of(context).size.width - 50 - (16 * 4)) / 5,
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              style: AppStyles.displayLarge.copyWith(fontSize: 27),
                              cursorHeight: 20,
                              cursorWidth: 1,
                              onChanged: (text) {},
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: AppColors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 28,
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: const Text(
                                'Resent Code',
                                style: AppStyles.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      AppElevatedButton(
                          buttonText: 'Confirm',
                          onTap: () {
                            _nextPage();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: CustomAppBar(
                  title: 'Reset Password',
                  onBack: () {
                    _prevPage();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter a new password',
                          style: AppStyles.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 96,),
                      AppTextFormField(hint: 'New Password', onChanged: (text) {}, showSuffixIcon: true,),
                      const SizedBox(height: 20,),
                      AppTextFormField(hint: 'Confirm Password', onChanged: (text) {}, showSuffixIcon: true,),
                      const SizedBox(height: 55,),
                      AppElevatedButton(
                          buttonText: 'Confirm',
                          onTap: () {
                            _nextPage();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
