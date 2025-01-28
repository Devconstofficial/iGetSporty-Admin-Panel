import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final double height;
  final double width;
  final Color borderColor;
  final Color fillColor;
  final Color hintColor;
  final bool isStyle;
  final TextInputType textInputType;
  final bool readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscure = false,
    this.height = 55,
    this.width = double.infinity,
    this.borderColor = kGreyShade9Color,
    this.fillColor = kWhiteColor,
    this.hintColor = kGreyColor,
    this.isStyle = false,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.suffix,
    this.suffixText,
    this.prefix,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.inputFormatters,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isObscure,
        readOnly: readOnly,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.blackTextStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: hintColor,
          ),
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffix,
          prefixIcon: prefix,
          suffix: suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: kBlackShadeColor,
        ),
      ),
    );
  }
}
