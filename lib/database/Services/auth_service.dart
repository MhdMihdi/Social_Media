import 'dart:convert';
import 'package:dev_space/database/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthService {

  static String baseUrl = 'http://192.168.1.5:8000/api/';

  static signUp({
    image, required firstName, required lastName,
    required birthDate,required email,
    required password, required location,
    required programmingAge, required specialty,
    required section, required frameWork,
    required language, required gender,
  }) async
  {
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse('${baseUrl}auth/signUp'),
    );
    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'email': email,
      'password': password,
      'current_location': location,
      'programming_age': programmingAge,
      'specialty': specialty,
      'section': section,
      'framework': frameWork,
      'language': language,
      'gender': gender
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var stringObject=await response.stream.bytesToString();
    debugPrint(stringObject);
    if (response.statusCode == 200 || response.statusCode == 201)
    {
      var user = userFromJson(stringObject);
      return user;
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  static logIn({
    required String email,
    required String password,
  }) async
  {
    debugPrint(email);
    debugPrint(password);
    var response= await http.post(
        Uri.parse('${baseUrl}auth/logIn'),
        headers: {
          //'Accept' : 'application/json',
          'Content-type' : 'application/json',
        },
        body:jsonEncode(<String,dynamic>{
          'email':email,
          'password':password,
        }),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201)
    {
      debugPrint(response.body.toString());
      var stringObject=response.body;
      var user = userFromJson(stringObject);
      return user;
    } else {
      return null;
    }
  }

  static forgotPassword({required email})async
  {
    var response= await http.post(
      Uri.parse('${baseUrl}auth/forgotPassword'),
      headers: {
        //'Accept' : 'application/json',
        'Content-type' : 'application/json',
      },
      body:jsonEncode(<String,dynamic>{
        'email':email,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201)
    {
      debugPrint(response.body.toString());

    } else {
      debugPrint(response.statusCode.toString());
    }
  }
  static checkCode({required code})async
  {
    var response= await http.post(
      Uri.parse('${baseUrl}auth/checkToken'),
      headers: {
        //'Accept' : 'application/json',
        'Content-type' : 'application/json',
      },
      body:jsonEncode(<String,dynamic>{
        'token':code,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201)
    {
      debugPrint(response.body.toString());

    } else {
      debugPrint(response.statusCode.toString());
    }
  }
  static resetPass({required code,required pass})async
  {
    var response= await http.post(
      Uri.parse('${baseUrl}auth/resetPassword'),
      headers: {
        //'Accept' : 'application/json',
        'Content-type' : 'application/json',
      },
      body:jsonEncode(<String,dynamic>{
        'token':code,
        'password':pass
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201)
    {
      debugPrint(response.body.toString());

    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
