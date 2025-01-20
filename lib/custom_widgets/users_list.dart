import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/status_selection_dialog.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/controller/dashboard_controller.dart';
import '../utils/app_styles.dart';

class UsersList extends StatelessWidget {
  final DashboardController controller = Get.find();

  UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 826.w,
      child: Obx(
        () => DataTable(
          dataRowMinHeight: 38.h,
          headingRowHeight: 48.h,
          columnSpacing: 50.w,
          dividerThickness: 0.4,
          headingRowColor: const WidgetStatePropertyAll(kGreyShadeColor),
          headingTextStyle: AppStyles.blackTextStyle().copyWith(
              color: kBlackShadeColor,
              fontWeight: FontWeight.w800,
              fontSize: 14.sp),
          dataTextStyle: AppStyles.blackTextStyle().copyWith(
            color: kBlackShadeColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            overflow: TextOverflow.ellipsis,
          ),
          columns: const [
            DataColumn(label: Text("User ID")),
            DataColumn(label: Text("User Name")),
            DataColumn(label: Text("Sports")),
            DataColumn(label: Text("City")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Action")),
          ],
          rows: controller.users.map((user) {
            return DataRow(
              cells: [
                DataCell(Text(
                  "${user.id!.substring(0, 10)}...",
                  maxLines: 1,
                )),
                DataCell(Text(
                  user.name ?? "N/A",
                )),
                DataCell(Text(
                  user.interestedSports!.join(','),
                  maxLines: 1,
                )),
                DataCell(Text(
                  user.city ?? "N/A",
                )),
                DataCell(
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: user.status == "Active"
                          ? kGreenColor.withOpacity(0.3)
                          : user.status == "Pending"
                              ? kPurpleColor.withOpacity(0.3)
                              : kRedColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                    child: Text(
                      user.status ?? "N/A",
                      style: TextStyle(
                        color: user.status == "Active"
                            ? kGreenColor
                            : user.status == "Pending"
                                ? kPurpleColor
                                : kRedColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    height: 33.h,
                    width: 99.w,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGreyShad1Color, width: 0.6),
                      color: kWhiteShadeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showStatusDialog(context, user.id!, false);
                          },
                          child: Image.asset(
                            kEditIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                        Container(
                          width: 0.6.w,
                          color: kGreyShade2Color,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.deleteUser(user.id!);
                          },
                          child: Image.asset(
                            kBinIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
