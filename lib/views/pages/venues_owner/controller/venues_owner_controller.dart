import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/models/venue_owner_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';

class VenuesOwnerController extends GetxController {
  var filteredOwners = <VenueOwnerModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var isApplied = false.obs;
  var selectedStatus = ''.obs;
  var selectedDates = <DateTime>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredOwners.assignAll(venueOwners);
  }

  var venueOwners = <VenueOwnerModel>[
    VenueOwnerModel(
      id: '0001',
      name: "Ahmad Ali",
      city: "LHR",
      ownerStatus: "Pending",
      sports: ['Cricket', 'Table Tennis'],
      facilities: ['Changing Room', 'Parking'],
      cnicImages: [kImg],
      venueImages: [kImg],
      pricingPerHour: '12',
      createdAt: DateTime(2024, 17, 12),
    ),
    VenueOwnerModel(
        id: '0002',
        name: "John Doe",
        city: "NYC",
        ownerStatus: "Active",
        sports: ['Cricket', 'Table Tennis'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 8, 12)),
    VenueOwnerModel(
        id: '0003',
        name: "Ahmad Ali",
        city: "LHR",
        ownerStatus: "Rejected",
        sports: ['Cricket', 'Table Tennis'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 12, 5)),
    VenueOwnerModel(
        id: '0004',
        name: "Michael Smith",
        city: "LHR",
        ownerStatus: "Active",
        sports: ['Basketball'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 6, 15)),
    VenueOwnerModel(
        id: '0005',
        name: "Sarah Brown",
        city: "NYC",
        ownerStatus: "Pending",
        sports: ['Cricket', 'Tennis'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 2, 14)),
    VenueOwnerModel(
        id: '0005',
        name: "Ahmad Ali",
        city: "LHR",
        ownerStatus: "Pending",
        sports: ['Cricket', 'Table Tennis'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 3, 14)),
    VenueOwnerModel(
        id: '0006',
        name: "Ahmad Ali",
        city: "LHR",
        ownerStatus: "Rejected",
        sports: ['Cricket', 'Table Tennis'],
        facilities: ['Changing Room', 'Parking'],
        cnicImages: [kImg],
        venueImages: [kImg],
        pricingPerHour: '12',
        createdAt: DateTime(2024, 12, 17)),
  ].obs;

  void updateOwnerStatus(String id, String newStatus) {
    final venueOwnerIndex = venueOwners.indexWhere((owner) => owner.id == id);
    if (venueOwnerIndex != -1) {
      venueOwners[venueOwnerIndex].ownerStatus = newStatus;
      venueOwners.refresh();
    }

    final filteredOwnerIndex =
        filteredOwners.indexWhere((owner) => owner.id == id);
    if (filteredOwnerIndex != -1) {
      filteredOwners[filteredOwnerIndex].ownerStatus = newStatus;
      filteredOwners.refresh();
    }
  }

  void deleteVenueOwner(String id) {
    venueOwners.removeWhere((owner) => owner.id == id);
    filteredOwners.removeWhere((owner) => owner.id == id);
    venueOwners.refresh();
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
        .where((owner) => selectedStatuses.contains(owner.ownerStatus))
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
    if (selectedDates.isNotEmpty) {
      filteredOwners.assignAll(venueOwners.where((owner) {
        if (owner.createdAt == null) return false;

        DateTime ownerDate = DateTime(owner.createdAt!.year,
            owner.createdAt!.month, owner.createdAt!.day);
        return selectedDates.any((selectedDate) =>
            selectedDate.year == ownerDate.year &&
            selectedDate.month == ownerDate.month &&
            selectedDate.day == ownerDate.day);
      }).toList());
    } else {
      filteredOwners.assignAll(venueOwners);
    }
  }
}
