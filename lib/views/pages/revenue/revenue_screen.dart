import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/revenue_chart.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/total_revenue_chart.dart';
import 'package:iget_sporty_admin_panel/models/revenue_location_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/controller/revenue_controller.dart';

import '../../../utils/app_styles.dart';

class RevenueScreen extends GetView<RevenueController> {
  final List<RevenueLocation> revenueData = [
    RevenueLocation(location: 'LHR', percentage: 38.6, colorHex: kBlueColor),
    RevenueLocation(
        location: 'KRC', percentage: 22.5, colorHex: kSecondaryColor),
    RevenueLocation(location: 'ISL', percentage: 30.8, colorHex: kRedColor),
    RevenueLocation(
        location: 'MUL', percentage: 8.1, colorHex: kDarkGreenColor),
  ];

  RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Expanded(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border(
                    bottom: BorderSide(
                        width: 1.w, color: kSideBarTextColor.withOpacity(0.1))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dashboard/Renvue",
                    style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: kSideBarTextColor.withOpacity(0.4)),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            color: kSideBarTextColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          style: AppStyles.blackTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kSideBarTextColor,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: kSideBarTextColor.withOpacity(0.2),
                              size: 18.sp,
                            ),
                            hintText: 'Search',
                            contentPadding:
                                EdgeInsets.symmetric(vertical: -5.h),
                            hintStyle: AppStyles.blackTextStyle().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kSideBarTextColor.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Image.asset(
                        kBellIcon,
                        height: 28.h,
                        width: 28.w,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Text(
                "Revenue",
                style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: kBlackShadeColor),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Row(
                children: [
                  _buildCard("Revenue", "\$695", kPrimaryColor),
                  SizedBox(width: 28.w),
                  _buildCard("Growth", "30.1%", kSecondaryColor),
                  SizedBox(width: 28.w),
                  _buildCard("Venues", "15", kPrimaryColor),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                TotalRevenueChart(width: 662.w, isRevenue: true),
                Container(
                  width: 446.w,
                  height: 336.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kGreyShade5Color),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revenue by Location',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: kSideBarTextColor,
                        ),
                      ),
                      SizedBox(height: 79.h),
                      Row(
                        children: [
                          Expanded(
                            child: RevenueChart(data: revenueData),
                          ),
                          SizedBox(width: 40.w),
                          Expanded(
                            child: Column(
                              children: revenueData
                                  .map((data) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: data.colorHex,
                                                  size: 6.sp,
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  data.location,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: kSideBarTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 48.w),
                                            Text(
                                              '${data.percentage}%',
                                              style: GoogleFonts.inter(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: kSideBarTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              margin: EdgeInsets.symmetric(horizontal: 28.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kGreyShade5Color),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Most Booked Venue for Single Game',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: kSideBarTextColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 1112.w,
                    child: DataTable(
                      dataRowMinHeight: 38.h,
                      headingRowHeight: 40.h,
                      dividerThickness: 0.4,
                      columnSpacing: 50.w,
                      headingRowColor:
                          const WidgetStatePropertyAll(kGreyShade5Color),
                      headingTextStyle: AppStyles.blackTextStyle().copyWith(
                          color: kSideBarTextColor.withOpacity(0.4),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                      dataTextStyle: AppStyles.blackTextStyle().copyWith(
                        color: kSideBarTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      columns: const [
                        // DataColumn(label: Text('Sport Name')),
                        DataColumn(label: Text('Venue Name')),
                        DataColumn(label: Text('Total Bookings')),
                        DataColumn(label: Text('Revenue Generated')),
                      ],
                      rows: controller.venueData.map((booking) {
                        return DataRow(
                          cells: [
                            // DataCell(Text(booking.sports.join(', '))),
                            DataCell(Text(booking.venueName)),
                            DataCell(Text('5')),
                            DataCell(
                              Text(
                                '\$200',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, Color color) {
    return Container(
      width: 202.w,
      height: 112.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppStyles.whiteTextStyle()),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: AppStyles.whiteTextStyle().copyWith(
                    fontSize: 24.sp,
                  )),
              Row(
                children: [
                  Text(value,
                      style: AppStyles.whiteTextStyle().copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(width: 4.w),
                  Image.asset(
                    kArrowIcon,
                    height: 16.h,
                    width: 16.w,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
