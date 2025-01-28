import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:image_network/image_network.dart';
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
              controller: TextEditingController(text: user.name ?? "N/A"),
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
              controller: TextEditingController(text: user.gender ?? "N/A"),
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
                  text: user.dateOfBirth != null
                      ? DateFormat('MM/dd/yyyy').format(user.dateOfBirth!)
                      : "N/A"),
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
              controller: TextEditingController(text: user.city ?? "N/A"),
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
                itemCount: user.interestedSports?.length ?? 0,
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
            Row(
              children: [
                user.cnicFrontImage != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: ImageNetwork(
                          image: user.cnicFrontImage!,
                          height: 112.h,
                          width: 167.w,
                          duration: 1500,
                          curve: Curves.easeIn,
                          onPointer: true,
                          debugPrint: false,
                          fitAndroidIos: BoxFit.cover,
                          fitWeb: BoxFitWeb.cover,
                          onError: Icon(Icons.broken_image,
                              size: 32.h, color: kGreyColor),
                          onLoading: const CircularProgressIndicator(
                            color: kSecondaryColor,
                          ),
                        ),
                      )
                    : Text(
                        "Front image not available",
                        style: AppStyles.blackTextStyle()
                            .copyWith(color: kGreyColor, fontSize: 14.sp),
                      ),
                SizedBox(width: 12.w),
                user.cnicBackImage != null
                    ? ImageNetwork(
                        image: user.cnicBackImage!,
                        height: 112.h,
                        width: 167.w,
                        duration: 1500,
                        curve: Curves.easeIn,
                        onPointer: true,
                        debugPrint: false,
                        fitAndroidIos: BoxFit.cover,
                        fitWeb: BoxFitWeb.cover,
                        onError: Icon(Icons.broken_image,
                            size: 32.h, color: kGreyColor),
                        onLoading: const CircularProgressIndicator(
                          color: kSecondaryColor,
                        ),
                      )
                    : Text(
                        "Back image not available",
                        style: AppStyles.blackTextStyle()
                            .copyWith(color: kGreyColor, fontSize: 14.sp),
                      ),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
