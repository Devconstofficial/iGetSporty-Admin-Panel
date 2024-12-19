class BookingModel {
  final String id;
  final String venueName;
  final List<String> sports;
  final List<String> venueImage;
  final String ownerName;
  final String venueLocation;
  final DateTime dateTime;
  final String bookingStatus;
  final int? totalBookings;
  final double? revenueGenerated;

  BookingModel({
    required this.id,
    required this.venueName,
    required this.sports,
    required this.venueImage,
    required this.ownerName,
    required this.venueLocation,
    required this.dateTime,
    required this.bookingStatus,
    this.totalBookings,
    this.revenueGenerated,
  });
}
