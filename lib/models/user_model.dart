class UserModel {
  String id;
  String? name;
  String? gender;
  DateTime? dateOfBirth;
  String? city;
  List<String> cnicImages;
  String? userStatus;
  List<String> sports;

  UserModel({
    required this.id,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.city,
    this.cnicImages = const [],
    this.userStatus,
    this.sports = const [],
  });
}
