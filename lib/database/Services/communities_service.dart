import 'dart:convert';
import 'package:dev_space/database/models/communties_models/communties_detalis_model.dart';
import 'package:dev_space/database/models/communties_models/get_communties_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:http/http.dart'as http;

class CommunitiesService{

  static Future getCommunities()async
  {
    String token = await CacheHelper.getData(key: 'token') ?? '';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
    };
    var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/getMyCommuites'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String stream= await response.stream.bytesToString();
    print(stream);
    if (response.statusCode == 200) {
      return getCommuitesModelFromJson(stream);
    }
    else {
      print(response.reasonPhrase);
    }
  }
  static Future getCommunityDetails({required id,required type})async
  {
    String token = await CacheHelper.getData(key: 'token') ?? '';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${Constants.baseUrl}posts/getcommunityInfo/$id'));
    request.headers.addAll(headers);
    request.fields.addAll({
      'type': type
    });
    http.StreamedResponse response = await request.send();
    String stream= await response.stream.bytesToString();
    print(stream);
    if (response.statusCode == 200) {
      return communitiesDetailsModelFromJson(stream);
    }
    else {
      print(response.reasonPhrase);
    }
  }
  static Future likePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Constants.baseUrl}posts/like_or_cancellike_on_post/$id'));
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
        'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${Constants.baseUrl}posts/dislike_or_canceldislike_on_post/$id'));
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

  static Future savePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.baseUrl}posts/saves/save'));
      request.fields.addAll({'id': id});

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      String message = jsonDecode(streamRes)["Message"];
      if (response.statusCode == 200) {
        if (message == 'save success') {
          return true;
        }else{
        return false;
        }
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future reportPost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('${Constants.baseUrl}posts/report_or_cancelreport_on_post/$id'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      //String message = jsonDecode(streamRes)["message"];
      if (response.statusCode == 200) {
        if(streamRes=='report') {
          return true;
        }else{
          return false;
        }
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
  static Future agreePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('${Constants.baseUrl}posts/agree_or_cancelagree_challenget/$id'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      String message = jsonDecode(streamRes)["message"];
      if (response.statusCode == 200) {
        if(message=='voted') {
          return true;
        } else{
          return false;
        }
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }


}