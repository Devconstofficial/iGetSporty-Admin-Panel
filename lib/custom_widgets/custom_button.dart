import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final double borderRadius;
  final String title;
  final Color textColor;
  final Color color;
  final double width;
  final double height;
  final double textSize;
  final Function()? onTap;
  final bool showShadow;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor = kWhiteColor,
    this.color = kSecondaryColor,
    this.width = 505,
    this.height = 64,
    this.borderRadius = 16,
    this.textSize = 16,
    this.showShadow = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: [
              showShadow
                  ? BoxShadow(
                      color: kPrimaryColor.withOpacity(0.25),
                      offset: const Offset(0, 10),
                      blurRadius: 9,
                      spreadRadius: 0)
                  : const BoxShadow(color: Colors.transparent),
            ]),
        child: Center(
          child: Text(
            title,
            style: AppStyles.whiteTextStyle()
                .copyWith(fontSize: textSize.sp, color: textColor),
          ),
        ),
      ),
    );
  }
}
