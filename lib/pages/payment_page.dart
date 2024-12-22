import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/pages/components/doctor_tile.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_paths.dart';

const paymentMethods = [
  (AppIcons.creditCard, 'Credit Card'),
  (AppIcons.gPay, 'Google Pay'),
  (AppIcons.aPay, 'Apple Pay'),
  (AppIcons.payPal, 'Paypal'),
];

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedMethod = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          title: 'Payment',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const DoctorTile(
                  isAppointed: true,
                ),
                const SizedBox(
                  height: 65,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(paymentMethods.length + paymentMethods.length, (index) {
                        if (index.isOdd) {
                          if (index == (paymentMethods.length * 2) - 1) {
                            return SizedBox(
                              height: 12 + 52 + MediaQuery.of(context).padding.bottom,
                            );
                          }
                          return const SizedBox(
                            height: 16,
                          );
                        }
                        if (index == (paymentMethods.length * 2) - 1) {
                          return SizedBox(
                            height: 12 + 52 + MediaQuery.of(context).padding.bottom,
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMethod = index ~/ 2;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: SvgPicture.asset(paymentMethods[index ~/ 2].$1),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    paymentMethods[index ~/ 2].$2,
                                    style: AppStyles.bodyMedium,
                                  ),
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    AnimatedContainer(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: const Color(0x4D006B2B))),
                                      duration: AppConstants.duration200,
                                    ),
                                    AnimatedOpacity(
                                      opacity: selectedMethod == index ~/ 2 ? 1 : 0,
                                      duration: AppConstants.duration200,
                                      child: AnimatedContainer(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          color: AppColors.primary,
                                          shape: BoxShape.circle,
                                        ),
                                        duration: AppConstants.duration200,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppElevatedButton(
                buttonText: 'Payment',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
