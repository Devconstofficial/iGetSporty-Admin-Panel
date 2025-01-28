import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/custom_widgets/custom_snackbar.dart';
import 'package:iget_sporty_admin_panel/models/booking_model.dart';
import 'package:iget_sporty_admin_panel/services/admin_services.dart';

class BookingsController extends GetxController {
  var filteredBookings = <BookingModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var bookings = <BookingModel>[].obs;
  var isApplied = false.obs;
  var isLoading = false.obs;
  var bookingId = "".obs;
  var selectedDates = <DateTime>[].obs;

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
          filteredBookings.assignAll(bookings);
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

  void _handleError(String message) {
    showCustomSnackbar("Error", message);
  }

  void searchBookings(String query) {
    if (query.isEmpty) {
      filteredBookings.assignAll(bookings);
    } else {
      filteredBookings.assignAll(bookings.where((booking) =>
          booking.venueName.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void filterBookingsByDates() {
    isApplied.value = true;
    if (selectedDates.isEmpty) {
      filteredBookings
          .assignAll(bookings); // If no dates are selected, show all bookings
      return;
    }

    filteredBookings.assignAll(
      bookings.where((booking) {
        return selectedDates.any((selectedDate) {
          // Parse booking.date to DateTime and compare only the date part
          DateTime bookingDate = DateTime.parse(booking.date).toLocal();
          return bookingDate.toIso8601String().substring(0, 10) ==
              selectedDate.toLocal().toIso8601String().substring(0, 10);
        });
      }).toList(),
    );
  }

  void filterBookingsByStatuses() {
    // isApplied.value = true;
    // filteredBookings.assignAll(bookings
    //     .where((owner) => selectedStatuses.contains(owner.bookingStatus))
    //     .toList());
  }

  void resetFilter() {
    isApplied.value = false;
    selectedStatuses.value = [];
    filteredBookings.assignAll(bookings);
  }
}
