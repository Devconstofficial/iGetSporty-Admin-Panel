import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_textfield.dart';
import 'package:iget_sporty_admin_panel/models/booking_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';

class BookingDetailScreen extends StatelessWidget {
  final BookingModel booking = Get.arguments as BookingModel;
  BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          "Booking Details",
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
            ImageNetwork(
              image: booking.venueImage.first,
              width: 242.w,
              height: 242.h,
              duration: 1500,
              curve: Curves.easeIn,
              onPointer: true,
              debugPrint: false,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover,
              onError: Icon(Icons.broken_image, size: 32.h, color: kGreyColor),
              onLoading: const CircularProgressIndicator(
                color: kSecondaryColor,
              ),
            ),

            SizedBox(height: 16.h),
            Text(
              "User Name",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: booking.ownerName),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Venue",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(text: booking.venueName),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            Text(
              "Booking Date",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: kBlackShadeColor),
            ),
            SizedBox(height: 12.h),
            CustomTextField(
              controller: TextEditingController(
                  text:
                      "${DateFormat('MM/dd/yyyy').format(DateTime.parse(booking.date))} ${booking.bookingTimeFrom}-${booking.bookingTimeTo}"),
              hintText: '',
              readOnly: true,
            ),
            SizedBox(height: 12.h),
            // Text(
            //   "Status",
            //   style: AppStyles.blackTextStyle().copyWith(
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w600,
            //       color: kBlackShadeColor),
            // ),
            // SizedBox(height: 12.h),
            // CustomTextField(
            //   controller: TextEditingController(text: booking.bookingStatus),
            //   hintText: '',
            //   readOnly: true,
            // ),
            // SizedBox(height: 12.h),
            // Text(
            //   "Sports",
            //   style: AppStyles.blackTextStyle().copyWith(
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w600,
            //       color: kBlackShadeColor),
            // ),
            // SizedBox(height: 12.h),
            // SizedBox(
            //   height: 50.h,
            //   child: ListView.builder(
            //     padding: EdgeInsets.zero,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: booking.sports.length,
            //     itemBuilder: (context, index) {
            //       String sport = booking.sports[index];
            //       return Padding(
            //         padding: EdgeInsets.only(right: 12.w),
            //         child: Container(
            //           padding: EdgeInsets.symmetric(
            //             vertical: 9.h,
            //             horizontal: 9.w,
            //           ),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               color: kWhiteColor,
            //               border: Border.all(color: kGreyShade10Color)),
            //           child: Center(
            //             child: Text(
            //               sport,
            //               style: AppStyles.blackTextStyle().copyWith(
            //                   fontSize: 14.sp,
            //                   fontWeight: FontWeight.w400,
            //                   color: kGreyShade10Color),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
