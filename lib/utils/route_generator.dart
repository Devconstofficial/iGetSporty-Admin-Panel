
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/bookings_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/dashboard_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/revenue_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/side_bar/side_bar_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/users_screen.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/venues_owner_screen.dart';

import 'app_strings.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kSideBarScreenRoute, page: () => const SideBarScreen(), binding: ScreenBindings()),
      GetPage(name: kDashboardScreenRoute, page: () => const DashboardScreen(), binding: ScreenBindings()),
      GetPage(name: kVenuesOwnerScreenRoute, page: () => const VenuesOwnerScreen(), binding: ScreenBindings()),
      GetPage(name: kRevnueScreenRoute, page: () => const RevenueScreen(), binding: ScreenBindings()),
      GetPage(name: kUsersScreenRoute, page: () => const UsersScreen(), binding: ScreenBindings()),
      GetPage(name: kBookingsScreenRoute, page: () => const BookingsScreen(), binding: ScreenBindings()),
    ];
  }
}
