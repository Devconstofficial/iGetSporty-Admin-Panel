import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/notifications_and_activities.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/total_revenue_chart.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/users_list.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/venue_owners_list.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/controller/dashboard_controller.dart';

import '../../../utils/app_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.find();
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

  @override
  initState() {
    super.initState();
    controller.getBoth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border(
                        bottom: BorderSide(
                            width: 1.w,
                            color: kSideBarTextColor.withOpacity(0.1))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dashboard",
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
                SizedBox(height: 28.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Text(
                        "Today",
                        style: AppStyles.blackTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: kSideBarTextColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: kSideBarTextColor.withOpacity(0.4),
                        size: 16.sp,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 28.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCard("Active Users",
                              controller.totalUsers.value, kPrimaryColor),
                          _buildCard(
                              "Active Venues Owners",
                              controller.totalVenueOwners.value,
                              kSecondaryColor),
                          _buildCard(
                              "Bookings This Week",
                              controller.totalBookingsThisWeek.value,
                              kPrimaryColor),
                          _buildCard(
                              "Revenue This Month", "500 Rs", kSecondaryColor),
                        ],
                      )),
                ),
                SizedBox(height: 24.h),
                const TotalRevenueChart(),
                SizedBox(height: 22.h),
                Container(
                  width: 892.w,
                  margin: EdgeInsets.symmetric(horizontal: 28.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 33.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(6, 6),
                          color: kBlackColor.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 54,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Venue Owners",
                            style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: kSideBarTextColor),
                          ),
                          Obx(() => Container(
                                height: 28.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kGreyShad1Color, width: 0.6),
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
                        ],
                      ),
                      SizedBox(height: 36.h),
                      VenueOwnersList(),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 892.w,
                  margin: EdgeInsets.symmetric(horizontal: 28.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 33.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(6, 6),
                          color: kBlackColor.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 54,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Users",
                            style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: kSideBarTextColor),
                          ),
                          Obx(() => Container(
                                height: 28.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kGreyShad1Color, width: 0.6),
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
                        ],
                      ),
                      SizedBox(height: 36.h),
                      Obx(() => controller.isLoadingUsers.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kSecondaryColor,
                              ),
                            )
                          : controller.users.isEmpty
                              ? const Center(child: Text('No players'))
                              : UsersList()),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          NotificationsAndActivities(),
        ],
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
