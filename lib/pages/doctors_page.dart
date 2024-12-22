import 'package:doctor_appoinment/navigation/routes.dart';
import 'package:doctor_appoinment/pages/components/custom_app_bar.dart';
import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_elevated_button.dart';
import 'package:doctor_appoinment/ui_kit/widgets/app_search_text_form_field.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';

import 'components/doctor_tile.dart';
import 'components/filter_bottom_sheet.dart';

const categories = [
  'Dermatology',
  'Cardiologist',
  'Pediatrics',
  'Ophthalmology',
];
const times = [
  '10:00 AM',
  '10:30 AM',
  '09:30 AM',
  '11:00 AM',
  '10:45 AM',
];

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: 'Select '),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              AppSearchTextFormField(
                hint: 'Search',
                onChanged: (text) {},
                onSuffixTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (ctx) {
                        return const FilterBottomSheet();
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Specialist',
                  style: AppStyles.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Column(
                children: List.generate(20, (index) {
                  if (index.isOdd) {
                    return const SizedBox(
                      height: 13,
                    );
                  }
                  return DoctorTile(
                    onPlusTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.docDetails);
                    },
                  );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 70 + 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


