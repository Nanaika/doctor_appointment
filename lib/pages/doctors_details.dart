import 'package:doctor_appoinment/navigation/routes.dart';
import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_paths.dart';

const docProperties = [
  (AppIcons.like, '150+', 'Patient'),
  (AppIcons.crown, '10 years', 'Experience'),
  (AppIcons.star, '4.9', 'Rating'),
];

class DoctorsDetails extends StatelessWidget {
  const DoctorsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          title: 'Doctor Detail',
          textColor: AppColors.white,
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 121,
                width: 112,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 3),
                  color: AppColors.backGround,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -2,
                      child: Image.asset(
                        AppImages.doc,
                        width: 112,
                        height: 112,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  if (index.isOdd) {
                    return const SizedBox(
                      width: 42,
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Color(0xFF39B0FF), shape: BoxShape.circle),
                        child: SvgPicture.asset(docProperties[index ~/ 2].$1),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        docProperties[index ~/ 2].$2,
                        style: AppStyles.displayMedium.copyWith(color: AppColors.white, fontSize: 15),
                      ),
                      Text(
                        docProperties[index ~/ 2].$3,
                        style: AppStyles.bodySmall.copyWith(color: AppColors.white, fontSize: 7),
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(
                    color: AppColors.backGround,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Dr. Kawsar Ahmed',
                        style: AppStyles.displayLarge.copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 6,
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
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(9, (index) {
                          if (index.isOdd) {
                            return const SizedBox(
                              width: 3,
                            );
                          }
                          return SvgPicture.asset(
                            AppIcons.star,
                            width: 19,
                            height: 19,
                            colorFilter: const ColorFilter.mode(Color(0xFFFEC413), BlendMode.srcIn),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'About Doctor',
                                style: AppStyles.bodyMedium,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Dr. Kawsar Ahmed is the top most Cardiologist specialist in Cumilla Medical Collage Hospital At Cumilla. He achived several awards foe his wonderful confriution in his own field. He is avaliable for privet consulatation. He achived several awards foe his wonderful confriution in his own field. He is avaliable for privet consulatation. ',
                                style: AppStyles.bodySmall.copyWith(fontSize: 14, color: const Color(0xFF979797)),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Recent comments',
                                    style: AppStyles.bodyMedium,
                                  ),
                                  Text(
                                    '2 Hour Ago',
                                    style: AppStyles.bodySmall.copyWith(
                                        color: const Color(0xFF979797), fontSize: 13, fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.userPhoto,
                                    width: 41,
                                    height: 41,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(9, (index) {
                                      if (index.isOdd) {
                                        return const SizedBox(
                                          width: 3,
                                        );
                                      }
                                      return SvgPicture.asset(
                                        AppIcons.star,
                                        width: 19,
                                        height: 19,
                                        colorFilter: const ColorFilter.mode(Color(0xFFFEC413), BlendMode.srcIn),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppElevatedButton(
                buttonText: 'Get Appointment',
                onTap: () {
                   Navigator.of(context).pushNamed(AppRoutes.getAppointment);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
