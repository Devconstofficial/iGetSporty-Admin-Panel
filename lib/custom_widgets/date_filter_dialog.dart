import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_styles.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/controller/venues_owner_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../views/pages/users/controller/users_controller.dart';

void showDateFilterDialog(BuildContext context, {bool isUser = false}) {
  final VenuesOwnerController controller = Get.find();
  final UsersController usersController = Get.find();
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        backgroundColor: kWhiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          width: 387.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 322.w,
                  child: Obx(() => TableCalendar(
                        focusedDay: isUser
                            ? usersController.selectedDates.isNotEmpty
                                ? usersController.selectedDates.last
                                : DateTime.now()
                            : controller.selectedDates.isNotEmpty
                                ? controller.selectedDates.last
                                : DateTime.now(),
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        rowHeight: 42.h,
                        daysOfWeekHeight: 22.h,
                        headerStyle: HeaderStyle(
                            titleTextStyle: AppStyles.blackTextStyle().copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: kBlackShadeColor,
                            ),
                            formatButtonVisible: false,
                            leftChevronVisible: false,
                            leftChevronMargin: EdgeInsets.zero,
                            leftChevronPadding: EdgeInsets.zero,
                            rightChevronMargin: EdgeInsets.zero,
                            rightChevronPadding: EdgeInsets.zero,
                            headerPadding: EdgeInsets.only(bottom: 24.h)),
                        daysOfWeekStyle: DaysOfWeekStyle(
                            dowTextFormatter: (date, locale) => date.weekday ==
                                    DateTime.sunday
                                ? 'S'
                                : date.weekday == DateTime.monday
                                    ? 'M'
                                    : date.weekday == DateTime.tuesday
                                        ? 'T'
                                        : date.weekday == DateTime.wednesday
                                            ? 'W'
                                            : date.weekday == DateTime.thursday
                                                ? 'T'
                                                : date.weekday ==
                                                        DateTime.friday
                                                    ? 'F'
                                                    : 'S',
                            weekdayStyle: GoogleFonts.nunitoSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: kBlackShadeColor.withOpacity(0.9),
                            ),
                            weekendStyle: GoogleFonts.nunitoSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: kBlackShadeColor.withOpacity(0.9),
                            )),
                        calendarStyle: CalendarStyle(
                          weekendTextStyle: GoogleFonts.nunitoSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: kBlackShadeColor.withOpacity(0.6),
                          ),
                          defaultTextStyle: GoogleFonts.nunitoSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: kBlackShadeColor.withOpacity(0.6),
                          ),
                          cellMargin: const EdgeInsets.all(2),
                          todayDecoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                          ),
                          todayTextStyle: GoogleFonts.nunitoSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: kBlackShadeColor.withOpacity(0.6),
                          ),
                          defaultDecoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(12.r),
                            shape: BoxShape.rectangle,
                          ),
                          selectedTextStyle: GoogleFonts.nunitoSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: kWhiteColor,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isUser
                              ? usersController.selectedDates
                                  .any((selected) => isSameDay(selected, day))
                              : controller.selectedDates
                                  .any((selected) => isSameDay(selected, day));
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          if (isUser) {
                            if (usersController.selectedDates
                                .contains(selectedDay)) {
                              usersController.selectedDates.remove(selectedDay);
                            } else {
                              usersController.selectedDates.add(selectedDay);
                            }
                          } else {
                            if (controller.selectedDates
                                .contains(selectedDay)) {
                              controller.selectedDates.remove(selectedDay);
                            } else {
                              controller.selectedDates.add(selectedDay);
                            }
                          }
                        },
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month'
                        },
                      )),
                ),
              ),
              SizedBox(height: 24.h),
              const Divider(color: kGreyShade2Color, thickness: 0.4),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: Text(
                  "*You can choose multiple date",
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
                    if (isUser) {
                      usersController.filterUsersByDate();
                      Get.back();
                    } else {
                      controller.filterOwnersByDate();
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
