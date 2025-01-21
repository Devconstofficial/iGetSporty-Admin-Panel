import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/services/admin_services.dart';

class UsersController extends GetxController {
  var filteredUsers = <UserModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var isApplied = false.obs;
  var selectedDates = <DateTime>[].obs;
  var selectedStatus = ''.obs;
  var isLoadingUsers = false.obs;
  var users = <UserModel>[].obs;
  var userId = ''.obs;
  var isUpdating = false.obs;

  Future<void> getAllPlayers() async {
    try {
      isLoadingUsers(true);

      Map<String, dynamic> response = await AdminServices.viewAllPlayers();

      if (response['success'] == true &&
          response['data']['status'] == "success") {
        var data = response['data']['data'];
        if (data != null) {
          users.value = List<UserModel>.from(
            data.map((user) => UserModel.fromJson(user)),
          );
          filteredUsers.assignAll(users);
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
        users.removeWhere((user) => user.id == id);
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
        final index = users.indexWhere((user) => user.id == id);
        if (index != -1) {
          users[index].status = status;
          users.refresh();
        }
        final filteredUserIndex =
            filteredUsers.indexWhere((user) => user.id == id);
        if (filteredUserIndex != -1) {
          filteredUsers[filteredUserIndex].status = status;
          filteredUsers.refresh();
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

  void searchUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(users.where((user) =>
          user.name?.toLowerCase().contains(query.toLowerCase()) ?? false));
    }
  }

  void filterUsersByStatuses() {
    isApplied.value = true;
    filteredUsers.assignAll(
        users.where((user) => selectedStatuses.contains(user.status)).toList());
  }

  void resetFilter() {
    isApplied.value = false;
    selectedStatuses.value = [];
    selectedDates.value = [];
    filteredUsers.assignAll(users);
  }

  void filterUsersByDate() {
    isApplied.value = true;
    Get.back();

    //if (selectedDates.isNotEmpty) {
    // filteredUsers.assignAll(users.where((user) {
    //   if (user.createdAt == null) return false;

    //   DateTime userDate = DateTime(
    //     user.createdAt!.year,
    //     user.createdAt!.month,
    //     user.createdAt!.day,
    //   );

    //     return selectedDates.any((selectedDate) =>
    //         selectedDate.year == userDate.year &&
    //         selectedDate.month == userDate.month &&
    //         selectedDate.day == userDate.day);
    //   }).toList());
    // } else {
    //   filteredUsers.assignAll(users);
    // }
  }

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }
}
