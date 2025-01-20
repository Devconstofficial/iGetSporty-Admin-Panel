import 'dart:convert';

class UserModel {
  final String? id;
  final String? profilePicture;
  final String? phoneNumber;
  final String? password;
  final String? role;
  final String? gender;
  final String? name;
  final DateTime? dateOfBirth;
  final String? city;
  final List<String>? interestedSports;
  final String? cnicFrontImage;
  final String? cnicBackImage;
  String? status;
  final List<String>? posts;
  final List<String>? followers;
  final List<String>? following;
  final List<String>? notificationIds;

  UserModel({
    this.id,
    this.profilePicture,
    this.phoneNumber,
    this.password,
    this.role,
    this.gender,
    this.name,
    this.dateOfBirth,
    this.city,
    this.interestedSports,
    this.cnicFrontImage,
    this.cnicBackImage,
    this.status,
    this.posts,
    this.followers,
    this.following,
    this.notificationIds,
  });

  // Factory method to create a UserModel instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      profilePicture: json['profilePicture'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      role: json['role'],
      gender: json['gender'],
      name: json['name'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      city: json['city'],
      interestedSports: json['interestedSports'] != null
          ? List<String>.from(json['interestedSports'])
          : null,
      cnicFrontImage: json['cnicFrontImage'],
      cnicBackImage: json['cnicBackImage'],
      status: json['status'],
      posts: json['posts'] != null ? List<String>.from(json['posts']) : null,
      followers: json['followers'] != null
          ? List<String>.from(json['followers'])
          : null,
      following: json['following'] != null
          ? List<String>.from(json['following'])
          : null,
      notificationIds: json['notificationIds'] != null
          ? List<String>.from(json['notificationIds'])
          : null,
    );
  }

  // Method to convert a UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'profilePicture': profilePicture,
      'phoneNumber': phoneNumber,
      'password': password,
      'role': role,
      'gender': gender,
      'name': name,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'city': city,
      'interestedSports': interestedSports,
      'cnicFrontImage': cnicFrontImage,
      'cnicBackImage': cnicBackImage,
      'status': status,
      'posts': posts,
      'followers': followers,
      'following': following,
      'notificationIds': notificationIds,
    };
  }

  static UserModel fromJsonString(String jsonString) {
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
