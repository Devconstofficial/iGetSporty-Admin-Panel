class VenueOwnerModel {
  String id;
  String? imageUrl;
  String? name;
  String? gender;
  DateTime? dateOfBirth;
  String? city;
  List<String> cnicImages;
  List<String> venueImages;
  String? ownerStatus;
  List<String> sports;
  List<String> facilities;
  DateTime? createdAt;
  String? pricingPerHour;

  VenueOwnerModel({
    required this.id,
    this.imageUrl,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.city,
    this.cnicImages = const [],
    this.venueImages = const [],
    this.ownerStatus,
    this.sports = const [],
    this.facilities = const [],
    this.createdAt,
    this.pricingPerHour,
  });
}
