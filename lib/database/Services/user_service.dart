// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/home_models/home_model.dart';


class UserService{

  static completeInfo({
      required  study_semester,
      required  current_year,
      required  section,
      required  study_sequence,
      required  companies,
      required  years_as_expert,
      required  work_at_company,
      required  phone_number,
      required  bio,
      required  country,
    }) async
    {
      String?token =await CacheHelper.getData(key: 'token');
      // debugPrint(token);
      var response= await http.post(
        Uri.parse('${Constants.baseUrl}users/completeInfo'),
        headers: {
          //'Accept' : 'application/json',
          'Accept' : 'application/json',
          'Authorization': 'Bearer $token'
        },
        body:jsonEncode(<String,dynamic>{
          //'student':student,
          'study_semester':study_semester,
          'current_year':current_year,
          'section':section,
          'study_sequence':study_sequence,
          'companies':companies,
          'years_as_expert':years_as_expert,
          'work_at_company':work_at_company,
          'phone_number':phone_number,
          'bio':bio,
          'country':country,

        }),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201)
      {
        debugPrint(response.body.toString());
        debugPrint('done');
      } else {
        return null;
      }
    }

  static Future getHomePagePosts()async
  {
    try{
       String token =await CacheHelper.getData(key: 'token')??'';

       // print(token!);
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
    };
    var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/gethomeposts'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
       String streamRes = await response.stream.bytesToString();
       print(response.statusCode);
       print(streamRes);
       if(response.statusCode==200) {
         return homeModelFromJson(streamRes);
       }
       else
         {
           return response.toString();
         }}catch (e){
      return e.toString();
    }
  }




}


