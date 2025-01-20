import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle blackTextStyle() => GoogleFonts.urbanist(
      fontSize: 20.sp, fontWeight: FontWeight.w600, color: kBlackColor);
  static TextStyle whiteTextStyle() => GoogleFonts.urbanist(
      fontSize: 14.sp, fontWeight: FontWeight.w600, color: kWhiteColor);
  static TextStyle greyTextStyle() => GoogleFonts.urbanist(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: kGreyShade11Color);
  static TextStyle sideBarTextStyle() => GoogleFonts.urbanist(
      fontSize: 16.sp.sp,
      fontWeight: FontWeight.w500,
      color: kSideBarTextColor);
  static TextStyle logoutTextStyle() => GoogleFonts.urbanist(
      fontSize: 15.sp, fontWeight: FontWeight.w800, color: kPrimaryAccentColor);
  static TextStyle chartAxisTextStyle() => GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: kBlackColor.withOpacity(0.4));

  static BoxDecoration redColorBoxDecoration() => BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16.r),
      );
  static BoxDecoration greenColorBoxDecoration() => BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(16.r),
      );
}
