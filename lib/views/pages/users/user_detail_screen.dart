import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:intl/intl.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user = Get.arguments as UserModel;
  UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          "User Details",
          style: AppStyles.blackTextStyle().copyWith(
              fontSize: 18.sp, fontWeight: FontWeight.w500, color: kBlackColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29.h),
            Text(
              "Name",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: user.name),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Gender",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: user.gender),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Date of birth",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(
                  text: DateFormat('MM/dd/yyyy').format(user.dateOfBirth!)),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "City",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: user.city),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Interested Sports",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: user.interestedSports!.length,
                itemBuilder: (context, index) {
                  String sport = user.interestedSports![index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 9.h,
                        horizontal: 9.w,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kWhiteColor,
                          border: Border.all(color: kGreyShade10Color)),
                      child: Center(
                        child: Text(
                          sport,
                          style: AppStyles.blackTextStyle().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kGreyShade10Color),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "CNIC Images",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Image.network(
                user.cnicFrontImage!,
                height: 112.h,
                width: 167.w,
                fit: BoxFit.cover,
              ),
            ),
            Image.network(
              user.cnicBackImage!,
              height: 112.h,
              width: 167.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
