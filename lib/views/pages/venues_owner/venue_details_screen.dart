import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/models/venue_owner_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';

class VenueDetailsScreen extends StatelessWidget {
  final VenueOwnerModel owner = Get.arguments as VenueOwnerModel;
  VenueDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          "Venue Details",
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
              "Venue Name",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: owner.name),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Location",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: owner.city),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Sports",
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
                itemCount: owner.sports.length,
                itemBuilder: (context, index) {
                  String sport = owner.sports[index];
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
              "Facilities",
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
                itemCount: owner.facilities.length,
                itemBuilder: (context, index) {
                  String sport = owner.facilities[index];
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
            SizedBox(
              height: 112.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: owner.cnicImages.length,
                itemBuilder: (context, index) {
                  final imagePath = owner.cnicImages[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Image.asset(
                      imagePath,
                      height: 112.h,
                      width: 167.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Venue Images",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 112.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: owner.venueImages.length,
                itemBuilder: (context, index) {
                  final imagePath = owner.venueImages[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Image.asset(
                      imagePath,
                      height: 112.h,
                      width: 167.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Pricing(per hour)",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: owner.pricingPerHour),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
