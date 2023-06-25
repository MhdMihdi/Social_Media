// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str)=>UserModel.toObject(json.decode(str));

class UserModel {
  User?user;
  String token;

  UserModel({
    required this.user,
    required this.token,
  });
  factory UserModel.toObject(Map<String,dynamic>json)=>
    UserModel(
        token: json['token'],
        user: User.toObject(json['user']),
    );
  Map<String,dynamic>toJson()=>{
    "token":token,
    "user": user!.toJson(),
  };
}

class User{
  int id;
  String email;

  User({
    required this.id,
    required this.email,
  });
  factory User.toObject(Map<String,dynamic>json)=>
      User(
          id: json['id'],
          email: json['email'],
      );
  Map<String,dynamic>toJson()=>{
    "id":id,
    "email":email,

  };
}