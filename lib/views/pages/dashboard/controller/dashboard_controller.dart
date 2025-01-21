import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/activity_model.dart';
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

  getBoth() async {
    Future.wait([
      getAllOwners(),
      getAllPlayers(),
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
          venueOwners.value = List<UserModel>.from(
            data.map((venue) => UserModel.fromJson(venue)),
          ).take(4).toList();
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
          response['data']['status'] == "success") {
        var data = response['data']['data'];
        if (data != null) {
          users.value = List<UserModel>.from(
            data.map((venue) => UserModel.fromJson(venue)),
          ).take(4).toList();
        }
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to fetch players.');
    } finally {
      isLoadingUsers(false);
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
        } else {
          users.removeWhere((user) => user.id == id);
        }
        Get.back();
        showCustomSnackbar('Success', response['data']['message'],
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

      if (response['success'] == true &&
          response['data']['status'] == "success") {
        if (venueOwners.any((owner) => owner.id == id)) {
          final index = venueOwners.indexWhere((owner) => owner.id == id);
          if (index != -1) {
            venueOwners[index].status = status;
            venueOwners.refresh();
          }
        } else {
          final index = users.indexWhere((user) => user.id == id);
          if (index != -1) {
            users[index].status = status;
            users.refresh();
          }
        }
        Get.back();
        showCustomSnackbar('Success', response['data']['message'],
            backgroundColor: Colors.green);
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to update user.');
    } finally {
      isUpdating(true);
    }
  }

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }
}
