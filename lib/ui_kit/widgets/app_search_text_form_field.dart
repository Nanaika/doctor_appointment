import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSearchTextFormField extends StatefulWidget {
  const AppSearchTextFormField({
    super.key,
    required this.hint,
    this.initialValue,
    required this.onChanged,
    this.formatters,
    this.keyboardType,
    this.center = false,
    this.controller, this.onSuffixTap,
  });

  final String hint;
  final String? initialValue;
  final void Function(String) onChanged;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final bool center;
  final TextEditingController? controller;
  final void Function()? onSuffixTap;

  @override
  State<AppSearchTextFormField> createState() => _AppSearchTextFormFieldState();
}

bool isObscureText = false;

class _AppSearchTextFormFieldState extends State<AppSearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      style: AppStyles.bodyMedium.apply(color: AppColors.black),
      cursorHeight: 20,
      cursorWidth: 1,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textAlign: widget.center ? TextAlign.center : TextAlign.start,
      inputFormatters: widget.formatters,
      obscureText: isObscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(CupertinoIcons.search, color: Color(0xFF979797),),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 48,
        ),
        suffixIcon: GestureDetector(
          onTap: widget.onSuffixTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  AppIcons.searchSettings,
                ),
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        isDense: true,
        hintStyle: AppStyles.bodyMedium.apply(color: AppColors.black.withOpacity(.5)),
        hintText: widget.hint,
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
    );
  }
}
