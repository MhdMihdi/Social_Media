// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  String message;
  HomeModelData data;

  HomeModel({
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    message: json["Message"],
    data: HomeModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "data": data.toJson(),
  };
}

class HomeModelData {
  List<List<dynamic>> posts;

  HomeModelData({
    required this.posts,
  });

  factory HomeModelData.fromJson(Map<String, dynamic> json) => HomeModelData(
    posts: List<List<dynamic>>.from(json["posts"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class PostModel {
  int id;
  String title;
  String content;
  String type;
  int likesCounts;
  int dislikesCounts;
  int reportsNumber;
  String locationType;
  int locationId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.likesCounts,
    required this.dislikesCounts,
    required this.reportsNumber,
    required this.locationType,
    required this.locationId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    title: json["title"]??'',
    content: json["content"],
    type: json["type"],
    likesCounts: json["likes_counts"],
    dislikesCounts: json["dislikes_counts"],
    reportsNumber: json["reports_number"],
    locationType: json["location_type"],
    locationId: json["location_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "type": type,
    "likes_counts": likesCounts,
    "dislikes_counts": dislikesCounts,
    "reports_number": reportsNumber,
    "location_type": locationType,
    "location_id": locationId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  int id;
  String firstName;
  String lastName;
  dynamic userIdentifier;
  DateTime birthDate;
  String email;
  DateTime emailVerifiedAt;
  dynamic phoneNumber;
  String currentLocation;
  DateTime programmingAge;
  String gender;
  dynamic bio;
  dynamic country;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.userIdentifier,
    required this.birthDate,
    required this.email,
    required this.emailVerifiedAt,
    this.phoneNumber,
    required this.currentLocation,
    required this.programmingAge,
    required this.gender,
    this.bio,
    this.country,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userIdentifier: json["user_identifier"],
    birthDate: DateTime.parse(json["birth_date"]),
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    phoneNumber: json["phone_number"],
    currentLocation: json["current_location"],
    programmingAge: DateTime.parse(json["programming_age"]),
    gender: json["gender"],
    bio: json["bio"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_identifier": userIdentifier,
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "phone_number": phoneNumber,
    "current_location": currentLocation,
    "programming_age": "${programmingAge.year.toString().padLeft(4, '0')}-${programmingAge.month.toString().padLeft(2, '0')}-${programmingAge.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "bio": bio,
    "country": country,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}





