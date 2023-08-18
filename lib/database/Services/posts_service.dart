import 'dart:convert';
import 'dart:io';
import 'package:dev_space/database/models/comment_model/comment_model.dart';
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

import '../models/home_models/home_model.dart';

class PostsService {
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
      request.fields
          .addAll({'title': title, 'content': content ?? "", 'type': type});
      print(request.fields);
      if (images != null) {
        for (int i = 0; i < images.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'image${i + 1}', images[i].path));
        }
      }

      if (videos != null) {
        for (int i = 0; i < videos.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
              'vedio${i + 1}', videos[i].path));
        }
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);
      print(streamRes);
      if (response.statusCode == 200) {
        return true;
      } else {
        return "something went wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future getHomePagePosts() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
      };
      var request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}posts/gethomeposts'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);

      if (response.statusCode == 200) {
        return homeModelFromJson(streamRes);
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future getProfilePosts() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        //'Accept': 'application/json',
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
      };
      var request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}users/get_my_profile_posts'));
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

  static Future getMyPosts() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}posts/getMyPosts'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String streamRes = await response.stream.bytesToString();
      print(response.statusCode);

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
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
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
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
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
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
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

  static Future reportPost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
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
        return true;
      } else {
        return response.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  ///stories
  static Future getActiveStories() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
      };
      var request = http.Request(
          'GET', Uri.parse('${Constants.baseUrl}posts/avtive_stories'));
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

  //comments
 static Future getComment ({required postId})async
 {
   String token = await CacheHelper.getData(key: 'token') ?? '';

   var headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/get_comments_on_post/$postId'));

   request.headers.addAll(headers);
   http.StreamedResponse response = await request.send();
   String streamRes = await response.stream.bytesToString();
   //print(streamRes);
   if (response.statusCode == 200) {
     return commentModelFromJson(streamRes);
   }
   else {
     print(response.reasonPhrase);
   }
 }
 static Future likeComment({required commentId})async
 {
   String token = await CacheHelper.getData(key: 'token') ?? '';
   var headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/like_or_cancellike_on_comment/$commentId'));

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();
   String streamRes = await response.stream.bytesToString();
   print(streamRes);
   if (response.statusCode == 200) {
     if (streamRes == 'cancel_like') {
       return false;
     }
     return true;
   }
   else {
     print(response.reasonPhrase);
   }

 }
 static Future dislikeComment({required commentId})async
 {
   String token = await CacheHelper.getData(key: 'token') ?? '';
   var headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/dislike_or_canceldislike_on_comment/$commentId'));

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   String streamRes = await response.stream.bytesToString();
   print(streamRes);
   if (response.statusCode == 200) {
     if (streamRes == 'cancel_dislikes') {
       return false;
     }
     return true;
   }
   else {
     print(response.reasonPhrase);
   }

 }
 static Future reportComment({required commentId})async
 {
   String token = await CacheHelper.getData(key: 'token') ?? '';
   var headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('GET', Uri.parse('${Constants.baseUrl}posts/report_or_cancelreport_on_comment/$commentId'));

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();
   String streamRes = await response.stream.bytesToString();
   if (response.statusCode == 200) {
     return true;
   }
   else {
     return response.toString();
   }
 }
 static Future createComment({required content,required id})async
 {
   var headers = {
     'Accept': 'application/json',
     'Content-Type': 'application/x-www-form-urlencoded',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('POST', Uri.parse('${Constants.baseUrl}posts/create_comment_on_post/$id'));
   request.bodyFields = {
     'content': content
   };
   request.headers.addAll(headers);
   http.StreamedResponse response = await request.send();
   String stream=await response.stream.bytesToString();
   var res=jsonDecode(stream);
   print(response.statusCode);
   print(res);
   if (response.statusCode == 200||response.statusCode==201) {
     return res;
   }
   else {
     print(response.reasonPhrase);
   }
 }
 static Future sharePost({required id,required type,required content})async
 {
   var headers = {
     'Accept': 'application/json',
     //'Content-Type': 'application/x-www-form-urlencoded',
     'Authorization': 'Bearer 1|lcRMmyu03137nCjoVgQ8Pul6DDWcl4z5znuG41qt'
   };
   var request = http.Request('POST', Uri.parse('${Constants.baseUrl}posts/share_post_2/$id'));
   request.bodyFields = {
     'type': type,
     'content': content
   };
   request.headers.addAll(headers);
   http.StreamedResponse response = await request.send();
   String stream=await response.stream.bytesToString();
   var res =jsonDecode(stream);
   if (response.statusCode == 200||response.statusCode==201) {
     return res;
   }
   else {
     print(response.reasonPhrase);
   }

 }
}

