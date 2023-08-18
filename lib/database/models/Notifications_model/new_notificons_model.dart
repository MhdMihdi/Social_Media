// To parse this JSON data, do
//
//     final oldNotifications = oldNotificationsFromJson(jsonString);

import 'dart:convert';

NewNotifications newNotificationsFromJson(String str) => NewNotifications.fromJson(json.decode(str));

String newNotificationsToJson(NewNotifications data) => json.encode(data.toJson());

class NewNotifications {
  String message;
  List<Datum> data;

  NewNotifications({
    required this.message,
    required this.data,
  });

  factory NewNotifications.fromJson(Map<String, dynamic> json) => NewNotifications(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String notification;
  String sendAt;

  Datum({
    required this.notification,
    required this.sendAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    notification: json["notification"],
    sendAt: json["notiication sent at"],
  );

  Map<String, dynamic> toJson() => {
    "notification": notification,
    "notiication sent at": sendAt,
  };
}
