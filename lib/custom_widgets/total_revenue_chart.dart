import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalRevenueChart extends StatelessWidget {
  const TotalRevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      width: double.infinity,
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
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 244.h,
            child: SfCartesianChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.top,
                alignment: ChartAlignment.near,
                isResponsive: true,
              ),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 30,
                interval: 10,
                // numberFormat: NumberFormat.compactSimpleCurrency(),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
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

// Revenue Data Model
class RevenueData {
  final String month;
  final double revenue;

  RevenueData(this.month, this.revenue);
}
