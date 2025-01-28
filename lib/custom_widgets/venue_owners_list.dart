import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_button.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/status_selection_dialog.dart';
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
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              )
            : controller.venueOwners.isEmpty
                ? const Center(child: Text('No owners'))
                : DataTable(
                    dataRowMinHeight: 38.h,
                    headingRowHeight: 48.h,
                    dividerThickness: 0.4,
                    columnSpacing: 50.w,
                    headingRowColor:
                        const WidgetStatePropertyAll(kGreyShadeColor),
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
                            "${owner.id!.substring(0, 5)}...",
                          )),
                          DataCell(Text(
                            owner.name ?? "N/A",
                          )),
                          DataCell(Text(
                            owner.interestedSports!.join(','),
                            maxLines: 1,
                          )),
                          DataCell(Text(
                            owner.city ?? "N/A",
                          )),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: owner.status == "Active"
                                    ? kGreenColor.withOpacity(0.3)
                                    : owner.status == "Pending"
                                        ? kPurpleColor.withOpacity(0.3)
                                        : kRedColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4.5),
                              ),
                              child: Text(
                                owner.status ?? "N/A",
                                style: TextStyle(
                                  color: owner.status == "Active"
                                      ? kGreenColor
                                      : owner.status == "Pending"
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
                              height: 40.h,
                              width: 99.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kGreyShad1Color, width: 0.6),
                                color: kWhiteShadeColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showStatusDialog(
                                          context, owner.id!, false,
                                          isDashboard: true);
                                    },
                                    child: Image.asset(
                                      kEditIcon,
                                      height: 24.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  Container(
                                    width: 0.6.w,
                                    color: kGreyShade2Color,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _displayDeleteDialog(owner.id!, context);
                                    },
                                    child: Image.asset(
                                      kBinIcon,
                                      height: 18.h,
                                      width: 18.w,
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

  Future<void> _displayDeleteDialog(String id, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: (20.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: (12.h), horizontal: (20.w)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          color: Color(0xFF858D9D),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      kBinIcon,
                      width: 50.w,
                      height: (50.h),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Confirm Delete",
                      style: AppStyles.blackTextStyle().copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: (5.h)),
                  Center(
                    child: Text(
                      "Are you sure you want to delete this user?",
                      textAlign: TextAlign.center,
                      style: AppStyles.blackTextStyle().copyWith(
                        color: Color(0xFFABABAB),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(),
                  SizedBox(height: 15.h),
                  Obx(() => controller.userId.value == id
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kSecondaryColor,
                          ),
                        )
                      : Center(
                          child: CustomButton(
                              width: 200,
                              title: 'Apply',
                              onTap: () {
                                controller.deleteUser(id);
                              }))),
                  SizedBox(height: (15.h)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
