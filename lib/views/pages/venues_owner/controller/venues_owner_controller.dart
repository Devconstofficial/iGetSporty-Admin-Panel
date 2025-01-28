import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:iget_sporty_admin_panel/services/admin_services.dart';

class VenuesOwnerController extends GetxController {
  var filteredOwners = <UserModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var isApplied = false.obs;
  var selectedStatus = ''.obs;
  var selectedDates = <DateTime>[].obs;
  var venueOwners = <UserModel>[].obs;
  var isLoading = false.obs;
  var userId = ''.obs;
  var isUpdating = false.obs;

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
          );
          filteredOwners.assignAll(venueOwners);
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

  Future<void> deleteUser(String id) async {
    try {
      userId.value = id;

      Map<String, dynamic> response = await AdminServices.deleteUser(id);

      if (response['success'] == true &&
          response['data']['status'] == "success") {
        venueOwners.removeWhere((user) => user.id == id);
        filteredOwners.assignAll(venueOwners);
        venueOwners.refresh();
        filteredOwners.refresh();
        Get.back();
        showCustomSnackbar('Success', 'Owner deleted successfully',
            backgroundColor: Colors.green);
      } else {
        _handleError(response['data']['message'] ?? 'Something went wrong');
      }
    } catch (e, stackTrace) {
      log('Error: $e\n$stackTrace');
      _handleError('Failed to delete user.');
    } finally {
      userId.value = '';
    }
  }

  Future<void> updateOwnerStatus(String status, String id) async {
    try {
      isApplied.value = true;
      isUpdating(true);

      Map<String, dynamic> response =
          await AdminServices.updateUserStatus({"status": status}, id);

      if (response['success'] == true && response['data']['success'] == true) {
        final index = venueOwners.indexWhere((user) => user.id == id);
        if (index != -1) {
          venueOwners[index].status = status;
          venueOwners.refresh();
        }
        final filteredOwnerIndex =
            filteredOwners.indexWhere((owner) => owner.id == id);
        if (filteredOwnerIndex != -1) {
          filteredOwners[filteredOwnerIndex].status = status;
          filteredOwners.refresh();
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
      isUpdating(false);
    }
  }

  void searchOwners(String query) {
    if (query.isEmpty) {
      filteredOwners.assignAll(venueOwners);
    } else {
      filteredOwners.assignAll(venueOwners.where((owner) =>
          owner.name?.toLowerCase().contains(query.toLowerCase()) ?? false));
    }
  }

  void filterOwnersByStatuses() {
    isApplied.value = true;
    filteredOwners.assignAll(venueOwners
        .where((user) => selectedStatuses.contains(user.status))
        .toList());
  }

  void resetFilter() {
    isApplied.value = false;
    selectedStatuses.value = [];
    selectedDates.value = [];
    filteredOwners.assignAll(venueOwners);
  }

  void filterOwnersByDate() {
    isApplied.value = true;
    Get.back();
    // if (selectedDates.isNotEmpty) {
    //   filteredOwners.assignAll(venueOwners.where((owner) {
    //     if (owner.createdAt == null) return false;

    //     DateTime ownerDate = DateTime(owner.createdAt!.year,
    //         owner.createdAt!.month, owner.createdAt!.day);
    //     return selectedDates.any((selectedDate) =>
    //         selectedDate.year == ownerDate.year &&
    //         selectedDate.month == ownerDate.month &&
    //         selectedDate.day == ownerDate.day);
    //   }).toList());
    // } else {
    //   filteredOwners.assignAll(venueOwners);
    // }
  }

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }
}
