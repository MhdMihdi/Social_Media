import 'dart:convert';
import 'dart:io';
import 'package:dev_space/database/models/friend_request_model/friend_request_model.dart';
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/home_models/home_model.dart';

class FriendRequestService {
  static Future getFriendRequests() async {
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
        return welcomeFriendRequestFromJson(streamRes);
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future AcceptOrRejectOrCancelFriendRequest(
      {required String id, required bool? isAccept}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request;
      if (isAccept!) {
        request = http.Request(
            'Post', Uri.parse('${Constants.baseUrl}friends/request/accept'));
      } else if (!isAccept) {
        request = http.MultipartRequest(
            'POST', Uri.parse('${Constants.baseUrl}friends/request/reject'));
      } else {
        request = http.MultipartRequest(
            'POST', Uri.parse('${Constants.baseUrl}friends/request/cancel'));
      }
      request.fields.addAll({'id': id.toString()});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      String message = jsonDecode(streamRes)["message"];
      if (response.statusCode == 200) {
        if (message == 'success') {
          return true;
        }
        return true;
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
