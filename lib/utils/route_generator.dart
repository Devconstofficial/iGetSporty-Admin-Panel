import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/forgot_password_email_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/forgot_password_otp_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/login_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/new_password_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/booking_detail_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/bookings_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/dashboard_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/revenue_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/side_bar/side_bar_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/user_detail_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/users_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/venue_details_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/venues_owner_screen.dart';

import 'app_strings.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: kSideBarScreenRoute,
          page: () => const SideBarScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kDashboardScreenRoute,
          page: () => const DashboardScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kVenuesOwnerScreenRoute,
          page: () => const VenuesOwnerScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kRevnueScreenRoute,
          page: () => RevenueScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kUsersScreenRoute,
          page: () => const UsersScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kBookingsScreenRoute,
          page: () => const BookingsScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kUserDetailsScreenRoute,
          page: () => UserDetailScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kBookingDetailsScreenRoute,
          page: () => BookingDetailScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kVenueDetailsScreenRoute,
          page: () => VenueDetailsScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kForgotPasswordScreenRoute,
          page: () => ForgotPasswordEmailScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kNewPasswordScreenRoute,
          page: () => NewPasswordScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kLoginScreenRoute,
          page: () => LoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: kPhoneVerificationScreenRoute,
          page: () => ForgotPasswordOtpScreen(),
          binding: ScreenBindings()),
    ];
  }
}
