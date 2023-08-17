// To parse this JSON data, do
//
//     final getCommuitesModel = getCommuitesModelFromJson(jsonString);

import 'dart:convert';

GetCommuitesModel getCommuitesModelFromJson(String str) => GetCommuitesModel.fromJson(json.decode(str));

String getCommuitesModelToJson(GetCommuitesModel data) => json.encode(data.toJson());

class GetCommuitesModel {
  String message;
  List<Datum> data;

  GetCommuitesModel({
    required this.message,
    required this.data,
  });

  factory GetCommuitesModel.fromJson(Map<String, dynamic> json) => GetCommuitesModel(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  int subscriberCounts;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.subscriberCounts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
