class BookingModel {
  final String id;
  final String venueName;
  final List<String> venueImage;
  final String ownerName;
  final String venueLocation;
  final String date;
  final String bookingTimeFrom;
  final String bookingTimeTo;

  BookingModel({
    required this.id,
    required this.venueName,
    required this.venueImage,
    required this.ownerName,
    required this.venueLocation,
    required this.date,
    required this.bookingTimeFrom,
    required this.bookingTimeTo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'venueName': venueName,
      'venueImage': venueImage,
      'ownerName': ownerName,
      'venueLocation': venueLocation,
      'dateTime': date,
      'bookingTimeFrom': bookingTimeFrom,
      'bookingTimeTo': bookingTimeTo,
    };
  }

  // Create a BookingModel from a JSON map
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['_id'] as String,
      venueName: json['venue']['name'] as String,
      venueImage: List<String>.from(json['venue']['images'] as List<dynamic>),
      ownerName: json['user']['name'] as String,
      venueLocation: json['venue']['location'] as String,
      date: json['bookingDate'] as String,
      bookingTimeFrom: json['bookingTimeFrom'] as String,
      bookingTimeTo: json['bookingTimeTo'] as String,
    );
  }
}
