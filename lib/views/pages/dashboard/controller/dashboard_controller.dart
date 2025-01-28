import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/activity_model.dart';
import 'package:iget_sporty_admin_panel/models/booking_model.dart';
import 'package:iget_sporty_admin_panel/models/notification_model.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/services/admin_services.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';

class DashboardController extends GetxController {
  var selectedMonth = "January".obs;
  var selectedStatus = ''.obs;
  var venueOwners = <UserModel>[].obs;
  var users = <UserModel>[].obs;
  var isLoading = false.obs;
  var isLoadingUsers = false.obs;
  var selectedUserId = ''.obs;
  var userId = ''.obs;
  var isUpdating = false.obs;
  var totalUsers = "0".obs;
  var totalVenueOwners = "0".obs;
  var totalBookingsThisWeek = "0".obs;
  var bookings = <BookingModel>[].obs;

  getBoth() async {
    Future.wait([
      getAllOwners(),
      getAllPlayers(),
      getAllBookings(),
    ]);
  }

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

  Future<void> getAllOwners() async {
    try {
      isLoading(true);

      Map<String, dynamic> response = await AdminServices.viewAllOwners();

      if (response['success'] == true &&
          response['data']['status'] == "success") {
        var data = response['data']['data'];
        if (data != null) {
          var owners = List<UserModel>.from(
            data.map((venue) => UserModel.fromJson(venue)),
          );
          venueOwners.value = owners.take(4).toList();
          totalVenueOwners.value = owners
              .where((owner) => owner.status == "Active")
              .length
              .toString();
        }
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to fetch owners.');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllPlayers() async {
    try {
      isLoadingUsers(true);

      Map<String, dynamic> response = await AdminServices.viewAllPlayers();

      if (response['success'] == true &&
          response['message']['status'] == "success") {
        var data = response['message']['data'];
        if (data != null) {
          var user = List<UserModel>.from(
            data.map((venue) => UserModel.fromJson(venue)),
          );
          users.value = user.take(4).toList();
          totalUsers.value =
              user.where((user) => user.status == "Active").length.toString();
        }
      } else {
        _handleError(response['message']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to fetch players.');
    } finally {
      isLoadingUsers(false);
    }
  }

  Future<void> getAllBookings() async {
    try {
      isLoading(true);

      Map<String, dynamic> response = await AdminServices.viewAllBookings();

      if (response['success'] == true &&
          response['message']['success'] == true) {
        var data = response['message']['data'];
        if (data != null) {
          bookings.value = List<BookingModel>.from(
            data.map((venue) => BookingModel.fromJson(venue)),
          );
          totalBookingsThisWeek.value = bookings
              .where((booking) => _isThisWeek(booking.date))
              .length
              .toString();
        }
      } else {
        _handleError(response['message']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to fetch players.');
    } finally {
      isLoading(false);
    }
  }

  bool _isThisWeek(String dateString) {
    try {
      DateTime bookingDate = DateTime.parse(dateString);
      DateTime now = DateTime.now();
      DateTime startOfWeek =
          now.subtract(Duration(days: now.weekday - 1)); // Monday
      DateTime endOfWeek = startOfWeek.add(Duration(days: 6)); // Sunday

      return bookingDate.isAfter(startOfWeek) &&
          bookingDate.isBefore(endOfWeek.add(Duration(days: 1)));
    } catch (e) {
      log('Error parsing date: $e');
      return false;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      userId.value = id;

      Map<String, dynamic> response = await AdminServices.deleteUser(id);

      if (response['success'] == true &&
          response['data']['status'] == "success") {
        if (venueOwners.any((owner) => owner.id == id)) {
          venueOwners.removeWhere((owner) => owner.id == id);

          venueOwners.refresh();
        } else {
          users.removeWhere((user) => user.id == id);

          users.refresh();
        }
        Get.back();
        showCustomSnackbar('Success', 'Deleted successfully',
            backgroundColor: Colors.green);
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to delete venue.');
    } finally {
      userId.value = '';
    }
  }

  Future<void> updateUserStatus(String status, String id) async {
    try {
      isUpdating(true);

      Map<String, dynamic> response =
          await AdminServices.updateUserStatus({"status": status}, id);

      if (response['success'] == true && response['data']['success'] == true) {
        if (users.any((element) => element.id == id)) {
          final index = users.indexWhere((user) => user.id == id);
          if (index != -1) {
            users[index].status = status;
            users.refresh();
          }
        } else {
          final index = venueOwners.indexWhere((user) => user.id == id);
          if (index != -1) {
            venueOwners[index].status = status;
            venueOwners.refresh();
          }
        }

        showCustomSnackbar('Success', 'Status updated successfully',
            backgroundColor: Colors.green);
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to update user.');
    } finally {
      isUpdating(false);
    }
  }

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }
}
