import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';

class UsersController extends GetxController {
  var filteredUsers = <UserModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var isApplied = false.obs;
  var selectedDates = <DateTime>[].obs;
  var selectedStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredUsers.assignAll(users);
  }

  var users = <UserModel>[].obs;

  void updateUserStatus(String id, String newStatus) {
    final index = users.indexWhere((user) => user.id == id);
    if (index != -1) {
      users[index].status = newStatus;
      users.refresh();
    }
    final filteredUserIndex = filteredUsers.indexWhere((user) => user.id == id);
    if (filteredUserIndex != -1) {
      filteredUsers[filteredUserIndex].status = newStatus;
      filteredUsers.refresh();
    }
  }

  void deleteUser(String id) {
    users.removeWhere((user) => user.id == id);
    filteredUsers.removeWhere((user) => user.id == id);
    users.refresh();
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

    if (selectedDates.isNotEmpty) {
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
    }
  }
}
