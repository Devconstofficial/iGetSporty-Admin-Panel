import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iget_sporty_admin_panel/models/booking_model.dart';
import 'package:iget_sporty_admin_panel/utils/app_images.dart';

class BookingsController extends GetxController {
  var filteredBookings = <BookingModel>[].obs;
  var searchController = TextEditingController();
  var selectedStatuses = [].obs;
  var isApplied = false.obs;

  @override
  void onInit() {
    super.onInit();
    filteredBookings.assignAll(bookings);
  }

  var bookings = <BookingModel>[
    BookingModel(
        id: '0001',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Pending'),
    BookingModel(
        id: '0002',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Confirmed'),
    BookingModel(
        id: '0003',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Pending'),
    BookingModel(
        id: '0004',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Confirmed'),
    BookingModel(
        id: '0005',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Pending'),
    BookingModel(
        id: '0006',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Confirmed'),
    BookingModel(
        id: '0007',
        venueName: 'Venue1',
        sports: ['Cricket', 'Table Tennis'],
        venueImage: [kImg],
        ownerName: 'Ahmad Ali',
        venueLocation: 'Lahore',
        dateTime: DateTime(2024, 17, 12),
        bookingStatus: 'Pending'),
  ].obs;

  void deleteBooking(String id) {
    bookings.removeWhere((booking) => booking.id == id);
    filteredBookings.removeWhere((booking) => booking.id == id);

    bookings.refresh();
  }

  void searchBookings(String query) {
    if (query.isEmpty) {
      filteredBookings.assignAll(bookings);
    } else {
      filteredBookings.assignAll(bookings.where((booking) =>
          booking.venueName.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void filterBookingsByStatuses() {
    isApplied.value = true;
    filteredBookings.assignAll(bookings
        .where((owner) => selectedStatuses.contains(owner.bookingStatus))
        .toList());
  }

  void resetFilter() {
    isApplied.value = false;
    selectedStatuses.value = [];
    filteredBookings.assignAll(bookings);
  }
}
