class VenueOwnerModel {
  String id;
  String? imageUrl;
  String? name;
  String? gender;
  DateTime? dateOfBirth;
  String? city;
  List<String> cnicImages;
  String? ownerStatus;
  List<String> sports;
  DateTime? createdAt;

  VenueOwnerModel({
    required this.id,
    this.imageUrl,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.city,
    this.cnicImages = const [],
    this.ownerStatus,
    this.sports = const [],
    this.createdAt,
  });
}
