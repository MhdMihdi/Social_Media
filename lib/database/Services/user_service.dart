// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dev_space/database/models/Notifications_model/new_notificons_model.dart';
import 'package:dev_space/database/models/Notifications_model/old_notification_model.dart';
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/database/models/profile_model/profile_model.dart';
import 'package:dev_space/modules/profile_screen/data_between_pro&edit.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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


  static Future getOldNotifications() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|RHPCnSsOEvut1nTh7mMyGocd6ZknULjLhq7DpNHh'
      };
      var request = http.Request('GET',
          Uri.parse('${Constants.baseUrl}users/show_old_notification'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        return oldNotificationsFromJson(streamRes);
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
  static Future getNewNotifications() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|RHPCnSsOEvut1nTh7mMyGocd6ZknULjLhq7DpNHh'
      };
      var request = http.Request('GET',
          Uri.parse('${Constants.baseUrl}users/show_unread_notification'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        return newNotificationsFromJson(streamRes);
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
      'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
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
    required companies,context
  }) async
  {
    String token = await CacheHelper.getData(key: 'token') ?? '';
    final Data data = ModalRoute.of(context)!.settings.arguments as Data;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|FuW1NtjDxRORULop39NPL8e2PTgamBq6mzV5H4HC'
    };

    var request = http.MultipartRequest('POST', Uri.parse('${Constants.baseUrl}users/profile/edit'));
    print(data.firstName);
    print(firstName);


   if (firstName!=null&&data.firstName!=firstName
       && lastName!=null&&data.lastName!=lastName
       && birthDate!=null&&data.birthDate!=birthDate
       && email!=null&&data.email!=email
       && phoneNumber!=null&&data.phoneNumber!=phoneNumber
       && currentLocation!=null&&data.currentLocation!=currentLocation
       && programmingAge!=null&&data.programmingAge!=programmingAge
       && bio!=null&&data.bio!=bio
       && city!=null&&data.country!=city
       && specialty!=null&&data.specialty!=specialty
       && section!=null&&data.section!=section
       && frameWork!=null&&data.framework!=frameWork
       && language!=null&&data.language!=language
       && study_semester!=null&&data.studySemester!=study_semester
       && current_year!=null&&data.currentYear!=current_year
       && study_sequence!=null&&data.studySequence!=study_sequence
       && years_as_expert!=null&&data.yearsAsExpert!=years_as_expert
       && work_at_company!=null&&data.workAtCompany!=work_at_company
       && companies!=null&&data.companies!=companies)
   {
        return request.fields.addAll({
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
  }
    print(phoneNumber);

    if(image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      print('ssss');
    }
    else {
      print(await response.stream.bytesToString());
    }

  }

}
