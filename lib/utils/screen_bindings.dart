import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/views/pages/auth/auth_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/bookings/controller/bookings_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/dashboard/controller/dashboard_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/revenue/controller/revenue_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/side_bar/controller/side_bar_screen_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/users/controller/users_controller.dart';
import 'package:iget_sporty_admin_panel/views/pages/venues_owner/controller/venues_owner_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SideBarController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => VenuesOwnerController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => RevenueController());
    Get.lazyPut(() => BookingsController());
    Get.lazyPut(() => AuthController());
  }
}
