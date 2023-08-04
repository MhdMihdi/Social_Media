// To parse this JSON data, do
//
//     final welcomeFriendRequest = welcomeFriendRequestFromJson(jsonString);

import 'dart:convert';

WelcomeFriendRequest welcomeFriendRequestFromJson(String str) => WelcomeFriendRequest.fromJson(json.decode(str));

String welcomeFriendRequestToJson(WelcomeFriendRequest data) => json.encode(data.toJson());

class WelcomeFriendRequest {
  String message;
  List<Request> requests;

  WelcomeFriendRequest({
    required this.message,
    required this.requests,
  });

  factory WelcomeFriendRequest.fromJson(Map<String, dynamic> json) => WelcomeFriendRequest(
    message: json["Message"],
    requests: List<Request>.from(json["Requests"].map((x) => Request.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Requests": List<dynamic>.from(requests.map((x) => x.toJson())),
  };
}

class Request {
  int id;
  String firstName;
  String lastName;
  dynamic userIdentifier;
  DateTime birthDate;
  String email;
  dynamic emailVerifiedAt;
  dynamic phoneNumber;
  String currentLocation;
  DateTime programmingAge;
  String gender;
  dynamic bio;
  dynamic country;
  DateTime createdAt;
  DateTime updatedAt;
  Receiver receiver;

  Request({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.userIdentifier,
    required this.birthDate,
    required this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    required this.currentLocation,
    required this.programmingAge,
    required this.gender,
    this.bio,
    this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.receiver,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userIdentifier: json["user_identifier"],
    birthDate: DateTime.parse(json["birth_date"]),
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phoneNumber: json["phone_number"],
    currentLocation: json["current_location"],
    programmingAge: DateTime.parse(json["programming_age"]),
    gender: json["gender"],
    bio: json["bio"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    receiver: Receiver.fromJson(json["receiver"]),
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
    "receiver": receiver.toJson(),
  };
}

class Receiver {
  int receiver;
  int sender;
  dynamic isApproved;
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  Receiver({
    required this.receiver,
    required this.sender,
    this.isApproved,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    receiver: json["receiver"],
    sender: json["sender"],
    isApproved: json["is_approved"],
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "receiver": receiver,
    "sender": sender,
    "is_approved": isApproved,
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
