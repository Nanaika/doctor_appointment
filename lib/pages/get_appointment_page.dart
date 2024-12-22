import 'package:doctor_appoinment/navigation/routes.dart';
import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../utils/assets_paths.dart';

const docProperties = [
  (AppIcons.like, '150+', 'Patient'),
  (AppIcons.crown, '10 years', 'Experience'),
  (AppIcons.star, '4.9', 'Rating'),
];
const morningSlots = ['10:30 am', '11:00 am', '11:30 am'];
const afternoonSlots = ['02:30 am', '03:00 am', '03:30 am', '04:00 am', '04:30 am', '05:00 am'];

class GetAppointmentPage extends StatefulWidget {
  const GetAppointmentPage({super.key});

  @override
  State<GetAppointmentPage> createState() => _GetAppointmentPageState();
}

class _GetAppointmentPageState extends State<GetAppointmentPage> {
  int selectedDate = -1;
  int selectedMorningSlot = -1;
  int selectedAfternoonSlot = -1;

  @override
  Widget build(BuildContext context) {
    final now = DateUtils.dateOnly(DateTime.now());
    final year = now.year;
    final month = now.month;
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final days = List.generate(daysInMonth, (index) {
      final dayDate = DateTime(year, month, index + 1);
      final weekDay = DateFormat('EEE').format(dayDate);
      final day = (index + 1).toString().padLeft(2, '0'); // Три буквы дня недели
      return (
        day,
        weekDay,
      );
    });

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
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.backGround,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'February',
                        style: AppStyles.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(days.length + days.length - 1, (index) {
                        if (index.isOdd) {
                          return const SizedBox(
                            width: 10,
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: index ~/ 2 == days.length - 1 ? 25 : 0, left: index ~/ 2 == 0 ? 25 : 0),
                            child: AnimatedContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: selectedDate == index ? AppColors.primary : AppColors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              duration: AppConstants.duration200,
                              child: Column(
                                children: [
                                  Text(
                                    days[index ~/ 2].$2.toString(),
                                    style: AppStyles.displayLarge.copyWith(
                                        fontSize: 12, color: selectedDate == index ? AppColors.white : AppColors.black),
                                  ),
                                  Text(
                                    days[index ~/ 2].$1.toString(),
                                    style: AppStyles.bodyMedium.copyWith(
                                        fontSize: 18,
                                        color: selectedDate == index ? AppColors.white : const Color(0xFF979797)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Morning Slots',
                        style: AppStyles.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(morningSlots.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMorningSlot = index;
                              });
                            },
                            child: AnimatedContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                              decoration: BoxDecoration(
                                color: selectedMorningSlot == index ? AppColors.primary : AppColors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              duration: AppConstants.duration200,
                              child: Text(
                                morningSlots[index],
                                style: AppStyles.bodySmall.copyWith(
                                    fontSize: 14,
                                    color: selectedMorningSlot == index ? AppColors.white : AppColors.black),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Afternoon Slots',
                        style: AppStyles.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(afternoonSlots.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAfternoonSlot = index;
                              });
                            },
                            child: AnimatedContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                              decoration: BoxDecoration(
                                color: selectedAfternoonSlot == index ? AppColors.primary : AppColors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              duration: AppConstants.duration200,
                              child: Text(
                                afternoonSlots[index],
                                style: AppStyles.bodySmall.copyWith(
                                    fontSize: 14,
                                    color: selectedAfternoonSlot == index ? AppColors.white : AppColors.black),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Fees information',
                        style: AppStyles.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: List.generate(3, (index) {
                        if (index.isOdd) {
                          return const SizedBox(
                            height: 21,
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (ctx) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                        SizedBox(height: 50,),
                                        SvgPicture.asset(
                                          AppIcons.bigLike,
                                          width: 70,
                                          height: 70,
                                        ),
                                        SizedBox(height: 50,),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Thanks You!\nYour Appointment Created.',
                                            style: AppStyles.displayLarge.copyWith(fontSize: 17),
                                          ),
                                        ),
                                        SizedBox(height: 13,),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'You booked an appoinment with dr. Kawsar Ahmed on sep 21, at 10:00 am.',
                                            style: AppStyles.bodySmall.copyWith(fontSize: 16, color: Color(0xFF979797)),
                                          ),
                                        ),
                                        SizedBox(height: 100,),
                                        AppElevatedButton(buttonText: 'Request For Appointment', onTap: () {
                                          Navigator.of(context).pushNamed(AppRoutes.payment);
                                        }),
                                        SizedBox(height: MediaQuery.of(context).padding.bottom,),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: SvgPicture.asset(index == 0 ? AppIcons.call : AppIcons.video),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        index == 0 ? 'Voice Call' : 'Video Call',
                                        style: AppStyles.displayLarge.copyWith(fontSize: 15),
                                      ),
                                      Text(
                                        index == 0
                                            ? 'Can make a voice call with doctor'
                                            : 'Can make a video call with doctor',
                                        style: AppStyles.bodySmall.copyWith(
                                            fontSize: 10, fontWeight: FontWeight.w300, color: const Color(0xFFA6A3B8)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 23),
                                  child: Text(
                                    index == 0 ? '\$10' : '\$20',
                                    style: AppStyles.labelMedium.copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
