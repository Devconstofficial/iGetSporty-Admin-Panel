import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/bookings_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/dashboard_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/revenue_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/users_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/venues_owner_screen.dart';

class SideBarController extends GetxController {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Dashboard',
      'icon': kDashboardIcon,
      'width': 20.w,
      'height': 20.w,
    },
    {
      'title': 'Venue Owner',
      'icon': kVenueIcon,
      'width': 20.w,
      'height': 14.w,
    },
    {
      'title': 'Users',
      'icon': kUserIcon,
      'width': 20.w,
      'height': 20.w,
    },
    {
      'title': 'Revenue',
      'icon': kRevenueIcon,
      'width': 20.w,
      'height': 22.w,
    },
    {
      'title': 'Bookings',
      'icon': kBookingIcon,
      'width': 20.w,
      'height': 22.w,
    },
  ];

  RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const DashboardScreen(),
    const VenuesOwnerScreen(),
    const UsersScreen(),
    RevenueScreen(),
    const BookingsScreen(),
  ];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
