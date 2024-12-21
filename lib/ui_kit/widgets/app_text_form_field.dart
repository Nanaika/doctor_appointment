import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/ui_kit/text_styles.dart';
import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.initialValue,
    required this.onChanged,
    this.formatters,
    this.keyboardType,
    this.center = false,
    this.controller,
    this.showSuffixIcon = false,
  });

  final String hint;
  final String? initialValue;
  final void Function(String) onChanged;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final bool center;
  final TextEditingController? controller;
  final bool showSuffixIcon;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

bool isObscureText = false;

class _AppTextFormFieldState extends State<AppTextFormField> {
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
        suffixIconConstraints: const BoxConstraints(maxWidth: 12 + 42,),
        suffixIcon: widget.showSuffixIcon
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                    child: SvgPicture.asset(
                      AppIcons.showHide,
                    ),
                  ),
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
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
