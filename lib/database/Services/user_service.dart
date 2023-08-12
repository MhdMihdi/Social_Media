// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/database/models/profile_model/profile_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/home_models/home_model.dart';

class UserService {
  static completeInfo({
    required study_semester,
    required current_year,
    required section,
    required study_sequence,
    required companies,
    required years_as_expert,
    required work_at_company,
    required phone_number,
    required bio,
    required country,
  }) async {
    String? token = await CacheHelper.getData(key: 'token');
    // debugPrint(token);
    var response = await http.post(
      Uri.parse('${Constants.baseUrl}users/completeInfo'),
      headers: {
        //'Accept' : 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, dynamic>{
        //'student':student,
        'study_semester': study_semester,
        'current_year': current_year,
        'section': section,
        'study_sequence': study_sequence,
        'companies': companies,
        'years_as_expert': years_as_expert,
        'work_at_company': work_at_company,
        'phone_number': phone_number,
        'bio': bio,
        'country': country,
      }),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint(response.body.toString());
      debugPrint('done');
    } else {
      return null;
    }
  }


  static Future getNotifications() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.Request('GET',
          Uri.parse('${Constants.baseUrl}friends/request/receiver/show'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        return welcomeStroiesFromJson(streamRes);
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
static Future getProfileInfo()async
{
  String token = await CacheHelper.getData(key: 'token') ?? '';

    var headers=
    {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|FuW1NtjDxRORULop39NPL8e2PTgamBq6mzV5H4HC'
    };
    try{
    var request=http.MultipartRequest('GET',
      Uri.parse('${Constants.baseUrl}users/profile/show'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String stream=await response.stream.bytesToString();
      print(response.statusCode);
      print(stream);
      if (response.statusCode == 200) {
         return profileModelFromJson(stream);
      } else {
        return response.toString();
      }
    }
     catch (e) {
      return e.toString();
      }
}
  static UpdateProfileInfo({
    image, required firstName, required lastName,
    required birthDate,required email,
    required phoneNumber,required currentLocation,
    required programmingAge,required bio,
    required city, required specialty,
    required section, required frameWork,
    required language,required study_semester,
    required current_year,required study_sequence,
    required years_as_expert ,required work_at_company,
    required companies
  }) async
  {
    String token = await CacheHelper.getData(key: 'token') ?? '';

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|FuW1NtjDxRORULop39NPL8e2PTgamBq6mzV5H4HC'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${Constants.baseUrl}users/profile/edit'));
    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'email': email,
      'phone_number': phoneNumber,
      'current_location': currentLocation,
      'programming_age': programmingAge,
      'bio': bio,
      'country': city,
      'specialty': specialty,
      'section': section,
      'framework': frameWork,
      'language': language,
      'study_semester': study_semester,
      'current_year': current_year,
      'study_sequence': study_sequence,
      'years_as_expert': years_as_expert,
      'work_at_company': work_at_company,
      'companies': companies
    });
    request.files.add(await http.MultipartFile.fromPath('image', image));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

}
