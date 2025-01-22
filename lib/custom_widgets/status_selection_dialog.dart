import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/controller/bookings_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/controller/users_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/controller/venues_owner_controller.dart';

import '../views/pages/dashboard/controller/dashboard_controller.dart';

Future<void> showStatusDialog(
    BuildContext context, String id, bool isVenueOwner,
    {bool isFilter = false}) {
  final DashboardController controller = Get.find();
  final VenuesOwnerController venuesOwnerController = Get.find();
  final UsersController usersController = Get.find();
  List<String> statuses = ["Active", "Blocked"];
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        backgroundColor: kWhiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          width: 521.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  isVenueOwner ? "Select Owner Status" : "Select User Status",
                  style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: kBlackShadeColor),
                ),
              ),
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  children: statuses.map((status) {
                    return GestureDetector(
                      onTap: () {
                        if (isFilter) {
                          if (!isVenueOwner) {
                            if (usersController.selectedStatuses
                                .contains(status)) {
                              usersController.selectedStatuses.remove(status);
                            } else {
                              usersController.selectedStatuses.add(status);
                            }
                          } else {
                            if (venuesOwnerController.selectedStatuses
                                .contains(status)) {
                              venuesOwnerController.selectedStatuses
                                  .remove(status);
                            } else {
                              venuesOwnerController.selectedStatuses
                                  .add(status);
                            }
                          }
                        } else if (!isFilter && isVenueOwner) {
                          venuesOwnerController.selectedStatus.value = status;
                        } else if (!isFilter && !isVenueOwner) {
                          usersController.selectedStatus.value = status;
                        } else {
                          controller.selectedStatus.value = status;
                        }
                      },
                      child: Obx(() => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 45.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: controller.selectedStatus.value ==
                                          status ||
                                      venuesOwnerController
                                              .selectedStatus.value ==
                                          status ||
                                      usersController.selectedStatus.value ==
                                          status ||
                                      venuesOwnerController.selectedStatuses
                                          .contains(status) ||
                                      usersController.selectedStatuses
                                          .contains(status)
                                  ? kSecondaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  color: kGreyShade2Color, width: 0.6),
                            ),
                            child: Text(
                              status,
                              style: AppStyles.blackTextStyle().copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedStatus.value ==
                                              status ||
                                          venuesOwnerController
                                                  .selectedStatus.value ==
                                              status ||
                                          usersController
                                                  .selectedStatus.value ==
                                              status ||
                                          venuesOwnerController.selectedStatuses
                                              .contains(status) ||
                                          usersController.selectedStatuses
                                              .contains(status)
                                      ? kWhiteColor
                                      : kBlackShadeColor),
                            ),
                          )),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24.h),
              const Divider(color: kGreyShade2Color, thickness: 0.4),
              isFilter ? SizedBox(height: 16.h) : SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  isFilter ? "*You can choose multiple Owner Status" : "",
                  style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kGreyShade8Color.withOpacity(0.6)),
                ),
              ),
              isFilter ? SizedBox(height: 34.h) : SizedBox(height: 0.h),
              Obx(() => controller.isUpdating.value ||
                      venuesOwnerController.isUpdating.value ||
                      usersController.isUpdating.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kSecondaryColor,
                      ),
                    )
                  : Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (isFilter) {
                            if (!isVenueOwner) {
                              if (usersController.selectedStatuses.isEmpty) {
                                showCustomSnackbar('Error',
                                    'Please select atleast one status');
                              } else {
                                usersController.filterUsersByStatuses();
                                Get.back();
                              }
                            } else {
                              if (venuesOwnerController
                                  .selectedStatuses.isEmpty) {
                                showCustomSnackbar('Error',
                                    'Please select atleast one status');
                              } else {
                                venuesOwnerController.filterOwnersByStatuses();
                                Get.back();
                              }
                            }
                          } else if (!isFilter && isVenueOwner) {
                            if (venuesOwnerController.selectedStatus.value ==
                                '') {
                              showCustomSnackbar(
                                  'Error', 'Please select a status');
                            } else {
                              venuesOwnerController.updateOwnerStatus(
                                  venuesOwnerController.selectedStatus.value,
                                  id);

                              Get.back();
                            }
                          } else if (!isFilter && !isVenueOwner) {
                            if (usersController.selectedStatus.value == '') {
                              showCustomSnackbar(
                                  'Error', 'Please select a status');
                            } else {
                              usersController.updateUserStatus(
                                  usersController.selectedStatus.value, id);

                              Get.back();
                            }
                          } else {
                            if (controller.selectedStatus.value == '') {
                              showCustomSnackbar(
                                  'Error', 'Please select a status');
                            } else {
                              controller.updateUserStatus(
                                  controller.selectedStatus.value, id);
                              Get.back();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: kSecondaryColor,
                          minimumSize: Size(129.w, 50.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          "Apply Now",
                          style: AppStyles.whiteTextStyle().copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showBookingStatusDialog(BuildContext context) {
  final BookingsController controller = Get.find();
  List<String> statuses = ["Pending", "Confirmed"];
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        backgroundColor: kWhiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          width: 521.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Select Booking Status",
                  style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: kBlackShadeColor),
                ),
              ),
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  children: statuses.map((status) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.selectedStatuses.contains(status)) {
                          controller.selectedStatuses.remove(status);
                        } else {
                          controller.selectedStatuses.add(status);
                        }
                      },
                      child: Obx(() => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 45.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color:
                                  controller.selectedStatuses.contains(status)
                                      ? kSecondaryColor
                                      : Colors.transparent,
                              border: Border.all(
                                  color: kGreyShade2Color, width: 0.6),
                            ),
                            child: Text(
                              status,
                              style: AppStyles.blackTextStyle().copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedStatuses
                                          .contains(status)
                                      ? kWhiteColor
                                      : kBlackShadeColor),
                            ),
                          )),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24.h),
              const Divider(color: kGreyShade2Color, thickness: 0.4),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "*You can choose multiple Booking Status",
                  style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kGreyShade8Color.withOpacity(0.6)),
                ),
              ),
              SizedBox(height: 34.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.selectedStatuses.isEmpty) {
                      showCustomSnackbar(
                          'Error', 'Please select atleast one status');
                    } else {
                      controller.filterBookingsByStatuses();
                      Get.back();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: kSecondaryColor,
                    minimumSize: Size(129.w, 35.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Apply Now",
                    style: AppStyles.whiteTextStyle()
                        .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
