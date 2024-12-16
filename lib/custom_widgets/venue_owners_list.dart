import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/controller/dashboard_controller.dart';
import '../utils/app_styles.dart';

class VenueOwnersList extends StatelessWidget {
  final DashboardController controller = Get.find();

  VenueOwnersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 826.w,
      child: Obx(
        () => DataTable(
          dataRowMinHeight: 38.h,
          headingRowHeight: 48.h,
          dividerThickness: 0.4,
          columnSpacing: 52.w,
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
            DataColumn(label: Text("Owner ID")),
            DataColumn(label: Text("Owner Name")),
            DataColumn(label: Text("Sports")),
            DataColumn(label: Text("City")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Action")),
          ],
          rows: controller.venueOwners.map((owner) {
            return DataRow(
              cells: [
                DataCell(Text(
                  owner.id,
                )),
                DataCell(Text(
                  owner.name ?? "N/A",
                )),
                DataCell(Text(
                  owner.sports.join(','),
                  maxLines: 1,
                )),
                DataCell(Text(
                  owner.city ?? "N/A",
                )),
                DataCell(
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: owner.ownerStatus == "Active"
                          ? kGreenColor.withOpacity(0.3)
                          : owner.ownerStatus == "Pending"
                              ? kPurpleColor.withOpacity(0.3)
                              : kRedColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                    child: Text(
                      owner.ownerStatus ?? "N/A",
                      style: TextStyle(
                        color: owner.ownerStatus == "Active"
                            ? kGreenColor
                            : owner.ownerStatus == "Pending"
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
                        Image.asset(
                          kEditIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                        Container(
                          width: 0.6.w,
                          color: kGreyShade2Color,
                        ),
                        Image.asset(
                          kBinIcon,
                          height: 16.h,
                          width: 16.w,
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
