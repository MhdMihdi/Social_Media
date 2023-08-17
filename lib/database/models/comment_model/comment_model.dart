// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  String message;
  List<Datum> data;

  CommentModel({
    required this.message,
    required this.data,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    message: json["Message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String commenter;
  String time;
  Comment comment;
  String?myReaction;

  Datum({
    required this.commenter,
    required this.time,
    required this.comment,
    required this.myReaction,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    commenter: json["commenter"],
    time: json["time"],
    comment: Comment.fromJson(json["comment"]),
    myReaction: json["my_reaction"],
  );

  Map<String, dynamic> toJson() => {
    "commenter": commenter,
    "time": time,
    "comment": comment.toJson(),
    "my_reaction": myReaction,
  };
}

class Comment {
  int id;
  String content;
  int postId;
  int userId;
  String?commentId;
  int reportsNumber;
  int likesCounts;
  int dislikesCounts;
  DateTime createdAt;
  DateTime updatedAt;
  User?user;

  Comment({
    required this.id,
    required this.content,
    required this.postId,
    required this.userId,
     this.commentId,
    required this.reportsNumber,
    required this.likesCounts,
    required this.dislikesCounts,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    content: json["content"],
    postId: json["post_id"],
    userId: json["user_id"],
    commentId: json["comment_id"] ?? (json["comment_id"]=null),
    reportsNumber: json["reports_number"],
    likesCounts: json["likes_counts"],
    dislikesCounts: json["dislikes_counts"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "post_id": postId,
    "user_id": userId,
    "comment_id": commentId,
    "reports_number": reportsNumber,
    "likes_counts": likesCounts,
    "dislikes_counts": dislikesCounts,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user?.toJson(),
  };
}

class User {
  int id;
  String firstName;
  String lastName;
  String?userIdentifier;
  DateTime birthDate;
  String email;
  DateTime emailVerifiedAt;
  String?phoneNumber;
  String currentLocation;
  DateTime programmingAge;
  String?gender;
  String?bio;
  String?country;
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
    required this.phoneNumber,
    required this.currentLocation,
    required this.programmingAge,
     this.gender,
     this.bio,
     this.country,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userIdentifier: json["user_identifier"]??(json["user_identifier"]=null),
    birthDate: DateTime.parse(json["birth_date"]),
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    phoneNumber: json["phone_number"]??(json["phone_number"]=null),
    currentLocation: json["current_location"]??(json["current_location"]=null),
    programmingAge: DateTime.parse(json["programming_age"]),
    gender: json["gender"]??(json["gender"]=null),
    bio: json["bio"]??(json["bio"]=null),
    country: json["country"]??(json["country"]=null),
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
