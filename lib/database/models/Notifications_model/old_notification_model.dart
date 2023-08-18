// To parse this JSON data, do
//
//     final oldNotifications = oldNotificationsFromJson(jsonString);

import 'dart:convert';

OldNotifications oldNotificationsFromJson(String str) => OldNotifications.fromJson(json.decode(str));

String oldNotificationsToJson(OldNotifications data) => json.encode(data.toJson());

class OldNotifications {
  String message;
  List<Datum> data;

  OldNotifications({
    required this.message,
    required this.data,
  });

  factory OldNotifications.fromJson(Map<String, dynamic> json) => OldNotifications(
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
  String readAt;

  Datum({
    required this.notification,
    required this.readAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    notification: json["notification"],
    readAt: json["read at"],
  );

  Map<String, dynamic> toJson() => {
    "notification": notification,
    "read at": readAt,
  };
}
