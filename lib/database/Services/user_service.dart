// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
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

  static Future getHomePagePosts() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}posts/gethomeposts'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        return homeModelFromJson(streamRes);
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future likePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Constants.baseUrl}posts/like_or_cancellike_on_post/${id}'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        if (streamRes == 'cancel_like') {
          return false;
        }
        return true;
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future dislikePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Constants.baseUrl}posts/dislike_or_canceldislike_on_post/${id}'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        if (streamRes == 'cancel_dislike') {
          return false;
        }
        return true;
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future createPost(
      {String title = '',
      String content = '',
      List<File>? images,
      List<File>? videos,
      required String type}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5',
        'Cookie':
            'XSRF-TOKEN=eyJpdiI6InZGdklvU2pNdXFFK08vRVpQMjVUdGc9PSIsInZhbHVlIjoia2JFT2Nxa1lCdWxZSTVCZXlCQkJGZjJ4bU9kWVNlQ2hzcmVWNDNNWU5NMzRvTmZ4ekkvTVVFb2xDb2pTbGtoZnlYcXBKcVZ6WUVIRytzR1gyMGIyTUhWdE1hT09WcjhnRmhmdW50UmlKYTJGUXgrTzdpVjBqZWgyRDU3MW95UUYiLCJtYWMiOiI0OGQyNjM4OWFjYjFjODkxY2VjMmVlMmI0ZjFiNzI0ZGEwN2M3ZWYyNDZkZWVhZmJlZDM4YjIyYmYxOGI3ZmRhIiwidGFnIjoiIn0%3D; devspace_session=eyJpdiI6IkQ4K3ZBSS9WL2NTT28rTTlnZjRWaFE9PSIsInZhbHVlIjoieW1iK3BIeERvb2t0dURCUEUyYlQ5c2Y3S3IySWlqY0Zoa3g0OXp6MmhzQVRGWUNlY1NOZmdxVmNKRUY2bURrSWZSNFJIRzdkMjZHeHlsQXJMVllmYTN3OHhYeGFZWDVCTy9tbWZqOUFEbTg5UkovQnVQcE9KRUlsTHpZYW9HNWkiLCJtYWMiOiI3ODRhNjhmNDIxNGIyMDI2Zjk2NjdhMzQ2M2M1NzU2ZmQ2YzFmMGQ3MmRlMjc1ZTFlZWExN2QwY2FjOWMzOGViIiwidGFnIjoiIn0%3D'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.baseUrl}posts/create_from_profile'));
      request.fields.addAll({'title': title, 'content': content??"", 'type': type});
      print(request.fields);
      if (images != null)
      {
        for (int i = 0; i < images.length; i++) {
          request.files.add(await http.MultipartFile.fromPath('image${i+1}',
              images[i].path));
        }
      }


      if (videos != null)
      {
        for (int i = 0; i < videos.length; i++) {
          request.files.add(await http.MultipartFile.fromPath('vedio${i+1}',
              videos[i].path));
        }
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {

          return true;
        }
        else{
          return "something went wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
