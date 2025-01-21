import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/services/shared_preferences.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'controller/side_bar_screen_controller.dart';

class SideBarScreen extends GetView<SideBarController> {
  const SideBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Row(
        children: [
          Container(
            width: 211.w,
            decoration: BoxDecoration(
                color: kWhiteColor,
                border:
                    Border(right: BorderSide(width: 1.w, color: kStrokeColor))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 30.h),
                    Image.asset(kAdminImage),
                    SizedBox(height: 29.h),
                    Text("Admin", style: AppStyles.blackTextStyle()),
                    Text("Prime Leonard",
                        style: AppStyles.chartAxisTextStyle()),
                    SizedBox(height: 30.h),
                    ...List.generate(
                      controller.menuItems.length,
                      (index) => Obx(
                        () => SidebarItem(
                          title: controller.menuItems[index]['title'],
                          icon: controller.menuItems[index]['icon'],
                          isActive: controller.selectedIndex.value == index,
                          onTap: () {
                            controller.updateIndex(index);
                          },
                          width: controller.menuItems[index]['width'],
                          height: controller.menuItems[index]['height'],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: SidebarItem(
                    title: 'LOGOUT',
                    icon: kLogoutIcon,
                    isActive: false,
                    width: 22.w,
                    height: 20.h,
                    onTap: () {
                      final PreferencesService prefs = PreferencesService();
                      prefs.clearUserData();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => controller.pages[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isActive;
  final VoidCallback onTap;
  final double width;
  final double height;

  const SidebarItem({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Container(
          decoration: BoxDecoration(
            color: isActive
                ? kSecondaryColor.withOpacity(0.5)
                : Colors.transparent,
            borderRadius: isActive
                ? BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r))
                : null,
            border: isActive
                ? Border(
                    right: BorderSide(
                      color: kPrimaryColor,
                      width: 5.w,
                    ),
                  )
                : null,
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Row(
            children: [
              Image.asset(
                icon,
                color: title == 'LOGOUT' ? kPrimaryAccentColor : kBlackColor,
                width: width,
                height: height,
              ),
              SizedBox(width: 5.w),
              Text(
                title,
                style: title == 'LOGOUT'
                    ? AppStyles.logoutTextStyle()
                    : AppStyles.sideBarTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
