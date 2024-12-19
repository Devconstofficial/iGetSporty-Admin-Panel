import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/controller/revenue_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalRevenueChart extends StatelessWidget {
  final double width;
  final bool isRevenue;
  const TotalRevenueChart(
      {super.key, this.width = double.infinity, this.isRevenue = false});

  @override
  Widget build(
    BuildContext context,
  ) {
    final RevenueController controller = Get.find();
    List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
      final months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ];

      return months.map((String month) {
        return DropdownMenuItem<String>(
          value: month,
          child: Text(month),
        );
      }).toList();
    }

    return Container(
      height: 336.h,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kGreyShade5Color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Total Revenue",
                style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: kSideBarTextColor),
              ),
              SizedBox(width: 16.w),
              Container(
                height: 20.h,
                width: 0.6,
                color: kSideBarTextColor.withOpacity(0.2),
              ),
              SizedBox(width: 16.w),
              Row(
                children: [
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: const BoxDecoration(
                      color: kSideBarTextColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Current Week",
                    style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSideBarTextColor),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Row(
                children: [
                  Container(
                    height: 6.h,
                    width: 6.w,
                    decoration: const BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Previous Week",
                    style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSideBarTextColor),
                  ),
                ],
              ),
              if (isRevenue) ...[
                const Spacer(),
                Obx(() => Container(
                      height: 28.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: kGreyShad1Color, width: 0.6),
                        color: kWhiteShadeColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        padding: EdgeInsets.zero,
                        dropdownColor: kWhiteColor,
                        value: controller.selectedMonth.value,
                        underline: const SizedBox.shrink(),
                        items: _buildDropdownMenuItems(),
                        onChanged: (value) {
                          controller.selectedMonth.value = value!;
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 20.sp,
                          color: kGreyShade3Color.withOpacity(0.4),
                        ),
                        style: AppStyles.blackTextStyle().copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: kGreyShade3Color.withOpacity(0.4),
                        ),
                      ),
                    )),
              ]
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 244.h,
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              plotAreaBorderColor: Colors.transparent,
              primaryXAxis: CategoryAxis(
                labelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: kSideBarTextColor.withOpacity(0.4),
                ),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 30,
                interval: 10,
                labelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: kSideBarTextColor.withOpacity(0.4),
                ),
              ),
              series: <CartesianSeries>[
                SplineSeries<RevenueData, String>(
                  name: 'Current Week',
                  color: kSecondaryColor,
                  width: 3,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    color: kSecondaryColor,
                  ),
                  dataSource: getCurrentWeekData(),
                  xValueMapper: (RevenueData revenue, _) => revenue.month,
                  yValueMapper: (RevenueData revenue, _) => revenue.revenue,
                ),
                SplineSeries<RevenueData, String>(
                  name: 'Previous Week',
                  color: kPrimaryColor,
                  width: 3,
                  dashArray: const <double>[5, 5],
                  dataSource: getPreviousWeekData(),
                  xValueMapper: (RevenueData revenue, _) => revenue.month,
                  yValueMapper: (RevenueData revenue, _) => revenue.revenue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<RevenueData> getCurrentWeekData() {
    return [
      RevenueData('Jan', 10),
      RevenueData('Feb', 20),
      RevenueData('Mar', 15),
      RevenueData('Apr', 10),
      RevenueData('May', 12),
      RevenueData('Jun', 18),
      RevenueData('Jul', 25),
    ];
  }

  List<RevenueData> getPreviousWeekData() {
    return [
      RevenueData('Jan', 15),
      RevenueData('Feb', 10),
      RevenueData('Mar', 18),
      RevenueData('Apr', 12),
      RevenueData('May', 15),
      RevenueData('Jun', 20),
      RevenueData('Jul', 22),
    ];
  }
}

class RevenueData {
  final String month;
  final double revenue;

  RevenueData(this.month, this.revenue);
}
