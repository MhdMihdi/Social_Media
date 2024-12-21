// To parse this JSON data, do
//
//     final communitiesDetailsModel = communitiesDetailsModelFromJson(jsonString);

import 'dart:convert';

CommunitiesDetailsModel communitiesDetailsModelFromJson(String str) => CommunitiesDetailsModel.fromJson(json.decode(str));

String communitiesDetailsModelToJson(CommunitiesDetailsModel data) => json.encode(data.toJson());

class CommunitiesDetailsModel {
  String message;
  List<dynamic> photo;
  Info info;
  Data data;

  CommunitiesDetailsModel({
    required this.message,
    required this.photo,
    required this.info,
    required this.data,
  });

  factory CommunitiesDetailsModel.fromJson(Map<String, dynamic> json) => CommunitiesDetailsModel(
    message: json["Message"],
    photo: List<dynamic>.from(json["photo"].map((x) => x)),
    info: Info.fromJson(json["info"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "photo": List<dynamic>.from(photo.map((x) => x)),
    "info": info.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  List<List<dynamic>> posts;

  Data({
    required this.posts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posts: List<List<dynamic>>.from(json["posts"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class PostClass {
  int id;
  String title;
  String content;
  String type;
  int likesCounts;
  int dislikesCounts;
  int reportsNumber;
  int approvalsCounter;
  String locationType;
  int locationId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  PostClass({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.likesCounts,
    required this.dislikesCounts,
    required this.reportsNumber,
    required this.approvalsCounter,
    required this.locationType,
    required this.locationId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory PostClass.fromJson(Map<String, dynamic> json) => PostClass(
    id: json["id"],
    title: json["title"]??'',
    content: json["content"],
    type: json["type"],
    likesCounts: json["likes_counts"],
    dislikesCounts: json["dislikes_counts"],
    reportsNumber: json["reports_number"],
    approvalsCounter: json["Approvals_counter"],
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
    "Approvals_counter": approvalsCounter,
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
  DateTime?emailVerifiedAt;
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
    required this.userIdentifier,
    required this.birthDate,
    required this.email,
    required this.emailVerifiedAt,
    required this.phoneNumber,
    required this.currentLocation,
    required this.programmingAge,
    required this.gender,
    required this.bio,
    required this.country,
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
    "email_verified_at": emailVerifiedAt,
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

class Info {
  int id;
  String name;
  int subscriberCounts;
  DateTime createdAt;
  DateTime updatedAt;

  Info({
    required this.id,
    required this.name,
    required this.subscriberCounts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    name: json["name"],
    subscriberCounts: json["subscriber_counts"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "subscriber_counts": subscriberCounts,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
