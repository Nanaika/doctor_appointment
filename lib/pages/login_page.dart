import 'package:doctor_appoinment/navigation/routes.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_text_form_field.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: 'Let’s Sign In',),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Welcome!',
                  style: AppStyles.displayLarge,
                ),
              ),
              const SizedBox(height: 88,),
              AppTextFormField(hint: 'Name', onChanged: (text) {}),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(hint: 'Password', onChanged: (text) {}, showSuffixIcon: true,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.forgotPass);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 28,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: const Text(
                        'Forgot Password',
                        style: AppStyles.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 75,),
              AppElevatedButton(buttonText: 'Sign In', onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.mainCategories, (_) => false);
              }),
              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.signUp, (_) => false);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?', style: AppStyles.labelMedium.copyWith(color: AppColors.black),),
                      const Text(' Sign Up', style: AppStyles.labelMedium,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 24,),
            ],
          ),
        ),
      ),
    );
  }
}
