import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/models/activity_model.dart';
import 'package:iget_sporty_admin_panel/models/notification_model.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/models/venue_owner_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';

class DashboardController extends GetxController {
  var selectedMonth = "January".obs;
  var venueOwners = <VenueOwnerModel>[
    VenueOwnerModel(
        id: '0001',
        name: "Ahmad Ali",
        city: "LHR",
        ownerStatus: "Pending",
        sports: ['Cricket', 'Table Tennis']),
    VenueOwnerModel(
        id: '0001',
        name: "John Doe",
        city: "NYC",
        ownerStatus: "Active",
        sports: ['Cricket', 'Table Tennis']),
  ].obs;

  // Users
  var users = <UserModel>[
    UserModel(
        id: '0001',
        name: "Alice",
        city: "LA",
        userStatus: "Pending",
        sports: ['Cricket', 'Table Tennis']),
    UserModel(
        id: '0002',
        name: "Bob",
        city: "SF",
        userStatus: "Active",
        sports: ['Cricket', 'Table Tennis']),
  ].obs;

  // Notifications
  var notifications = <NotificationModel>[
    NotificationModel(
        title: "New user registered",
        content: "59 minutes ago",
        time: DateTime.now()),
    NotificationModel(
        title: "New user registered",
        content: "59 minutes ago",
        time: DateTime.now()),
  ].obs;

  RxList<Activity> activities = <Activity>[
    Activity(
      title: "Venue Approved",
      description: "Your venue 'Soccer Field' has been approved.",
      timestamp: "2 hours ago",
      icon: kAvatar,
    ),
    Activity(
      title: "New Booking",
      description: "A new booking has been made for 'Basketball Court'.",
      timestamp: "4 hours ago",
      icon: kAvatar,
    ),
    Activity(
      title: "Venue Pending",
      description: "Your venue 'Tennis Ground' is pending approval.",
      timestamp: "1 day ago",
      icon: kAvatar,
    ),
    Activity(
      title: "Venue Rejected",
      description: "Your venue 'Swimming Pool' has been rejected.",
      timestamp: "2 days ago",
      icon: kAvatar,
    ),
  ].obs;
}
