import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/date_filter_dialog.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/status_selection_dialog.dart';
import 'package:iget_sporty_admin_panel/utils/app_colors.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/utils/app_strings.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/controller/bookings_controller.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_styles.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final BookingsController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAllBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 28.w),
            decoration: BoxDecoration(
              color: kWhiteColor,
              border: Border(
                  bottom: BorderSide(
                      width: 1.w, color: kSideBarTextColor.withOpacity(0.1))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dashboard/Bookings",
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
                        controller: controller.searchController,
                        onChanged: (value) => controller.searchBookings(value),
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
                          contentPadding: EdgeInsets.symmetric(vertical: -5.h),
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
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Text(
              "Booking",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: kSideBarTextColor),
            ),
          ),
          SizedBox(height: 32.h),
          Obx(
            () => Container(
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              margin: EdgeInsets.only(
                  left: 37.w,
                  right: controller.isApplied.value ? 528.w : 851.w),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyShad1Color, width: 0.6),
                color: kWhiteShadeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      kFilterIcon,
                      height: 23.h,
                      width: 20.w,
                    ),
                  ),
                  Container(
                    width: 0.6.w,
                    color: kGreyShade2Color,
                  ),
                  Text(
                    "Filter By",
                    style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: kBlackShadeColor),
                  ),
                  Container(
                    width: 0.6.w,
                    color: kGreyShade2Color,
                  ),
                  InkWell(
                    onTap: () {
                      showDateFilterDialog(context, isUser: true);
                    },
                    child: Obx(() => Row(
                          children: [
                            SizedBox(
                              width: controller.selectedDates.isNotEmpty &&
                                      controller.isApplied.value
                                  ? 90.w
                                  : 35.w,
                              child: Text(
                                controller.isApplied.value &&
                                        controller.selectedDates.isNotEmpty
                                    ? controller.selectedDates
                                        .map((date) =>
                                            DateFormat('d MMM y').format(date))
                                        .join(', ')
                                    : "Date",
                                style: AppStyles.blackTextStyle().copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: controller.isApplied.value
                                        ? kBlackShadeColor.withOpacity(0.5)
                                        : kBlackShadeColor,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: controller.isApplied.value
                                  ? kBlackShadeColor.withOpacity(0.5)
                                  : kBlackShadeColor,
                              size: 18.sp,
                            )
                          ],
                        )),
                  ),
                  Obx(() => controller.isApplied.value
                      ? Container(
                          width: 0.6.w,
                          color: kGreyShade2Color,
                        )
                      : const SizedBox.shrink()),
                  Obx(() => controller.isApplied.value
                      ? InkWell(
                          onTap: () {
                            controller.resetFilter();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.replay,
                                color: kPrimaryColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Reset Filter",
                                style: AppStyles.blackTextStyle().copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink()),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: SizedBox(
              width: 1141.w,
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kSecondaryColor,
                        ),
                      )
                    : controller.filteredBookings.isEmpty
                        ? const Center(child: Text('No bookings'))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kGreyShade7Color, width: 0.3),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: DataTable(
                                dataRowMinHeight: 38.h,
                                headingRowHeight: 48.h,
                                dividerThickness: 0.4,
                                columnSpacing: 50.w,
                                border: TableBorder.all(
                                  color: Colors.transparent,
                                  width: 0.3,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                headingRowColor: const WidgetStatePropertyAll(
                                    kGreyShade6Color),
                                headingTextStyle: AppStyles.blackTextStyle()
                                    .copyWith(
                                        color: kBlackShadeColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14.sp),
                                dataTextStyle:
                                    AppStyles.blackTextStyle().copyWith(
                                  color: kBlackShadeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                columns: const [
                                  DataColumn(label: Text("Booking ID")),
                                  DataColumn(label: Text("User")),
                                  DataColumn(label: Text("Location(City)")),
                                  DataColumn(label: Text("Venue")),
                                ],
                                rows:
                                    controller.filteredBookings.map((booking) {
                                  return DataRow(
                                    cells: [
                                      DataCell(onTap: () {
                                        Get.toNamed(kBookingDetailsScreenRoute,
                                            arguments: booking);
                                      },
                                          Text(
                                            booking.id,
                                          )),
                                      DataCell(onTap: () {
                                        Get.toNamed(kBookingDetailsScreenRoute,
                                            arguments: booking);
                                      },
                                          Text(
                                            booking.ownerName,
                                          )),
                                      DataCell(onTap: () {
                                        Get.toNamed(kBookingDetailsScreenRoute,
                                            arguments: booking);
                                      },
                                          Text(
                                            booking.venueLocation,
                                            maxLines: 1,
                                          )),
                                      DataCell(onTap: () {
                                        Get.toNamed(kBookingDetailsScreenRoute,
                                            arguments: booking);
                                      },
                                          Text(
                                            booking.venueName,
                                            maxLines: 1,
                                          )),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
