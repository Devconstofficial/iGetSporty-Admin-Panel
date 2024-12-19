import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iget_sporty_admin_panel/models/notification_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/controller/dashboard_controller.dart';

class NotificationsAndActivities extends StatelessWidget {
  final DashboardController controller = Get.find();

  NotificationsAndActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: 1.w, color: kSideBarTextColor.withOpacity(0.1))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h),
            Text(
              "Notifications",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: kSideBarTextColor,
              ),
            ),
            SizedBox(height: 16.h),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = controller.notifications[index];
                    return _buildNotificationItem(notification);
                  },
                )),
            SizedBox(height: 32.h),
            Text(
              "Activities",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: kSideBarTextColor,
              ),
            ),
            SizedBox(height: 16.h),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.activities.length,
                  itemBuilder: (context, index) {
                    final activity = controller.activities[index];
                    return _buildActivityItem(activity);
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(activity) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (activity.icon != null)
            CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(activity.icon!),
            ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: AppStyles.blackTextStyle().copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: kSideBarTextColor,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  activity.timestamp,
                  style: AppStyles.blackTextStyle().copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: kSideBarTextColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            height: 24.h,
            width: 24.w,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kGreyShade4Color),
            child: Center(
              child: Image.asset(
                kUserIcon,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: AppStyles.blackTextStyle().copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: kSideBarTextColor,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                notification.content,
                style: AppStyles.blackTextStyle().copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: kSideBarTextColor.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
