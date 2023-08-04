import 'dart:convert';
import 'dart:io';
import 'package:dev_space/database/models/home_models/story_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
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
    // try {
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
    // } catch (e) {
    //   return e.toString();
  // }
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

  static Future savePost({required String id}) async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.baseUrl}posts/saves/save'));
      request.fields.addAll({'id': '1'});

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

  ///stories
  static Future getActiveStories() async {
    try {
      String token = await CacheHelper.getData(key: 'token') ?? '';

      // print(token!);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 1|a1gnqWkHrpDfVt4xyx5pERN08zIcf82KpjagygW5'
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
}
// jsonEncode({
// "Message": "success",
// "data": {
// "posts": [
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 1,
// "title": "Prof.",
// "content": "Illo nulla est eaque pariatur quae ut molestiae quo. Dolores ullam placeat error error. Distinctio dolore eum minus voluptatibus at rerum. Numquam velit cum architecto et omnis velit.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T12:38:14.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 2,
// "title": "Prof.",
// "content": "Soluta sit sed eius ad aut. Fuga ratione rerum amet consequuntur aut illo. Ea sunt nihil nobis ratione animi.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T12:38:21.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 3,
// "title": "Mr.",
// "content": "Ea ut commodi assumenda eos. Numquam odio atque labore eius veniam. Qui iure a nesciunt consequatur rerum maxime. Eum id numquam blanditiis in nam incidunt. Molestiae qui sint voluptas magni est hic.",
// "type": "CV",
// "likes_counts": 10,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T13:12:02.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is like",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 4,
// "title": "Mr.",
// "content": "Minus fuga mollitia recusandae. Officiis vitae recusandae et voluptatem. Ad et nobis doloribus modi. Molestiae dolor nisi aspernatur qui nam.",
// "type": "CV",
// "likes_counts": 10,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-02T16:11:05.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is like",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 5,
// "title": "Dr.",
// "content": "Excepturi mollitia nobis dolorem alias ratione. Ut rerum maiores aut quidem eos veritatis. Quam corrupti et et in. Minima nam placeat numquam et. Numquam sunt nobis non distinctio nisi quis.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 1,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\Page",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T13:29:30.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is dislikes",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 6,
// "title": "Prof.",
// "content": "Nam modi consectetur tenetur voluptatem doloribus. Alias ducimus laboriosam qui eos impedit aperiam. Debitis a assumenda ut quod dolore aperiam.",
// "type": "CV",
// "likes_counts": 10,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\Community",
// "location_id": 4,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T22:29:53.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is like",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 7,
// "title": "Prof.",
// "content": "Quibusdam voluptatem a quasi quibusdam. Et repellat esse fugit quod beatae qui sequi maxime.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 1,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\Community",
// "location_id": 5,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T13:49:12.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is dislikes",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 8,
// "title": "Miss",
// "content": "Rem accusamus nesciunt non saepe corporis. Qui earum consequuntur eligendi voluptatem quo labore aliquam facilis. Non vitae error facilis commodi ad quidem.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\Community",
// "location_id": 37,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-02T16:11:05.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "yestarday at :  04:11 PM",
// {
// "id": 9,
// "title": "Prof.",
// "content": "Unde quia iure voluptas sed. Commodi deleniti mollitia sit culpa. Omnis optio tenetur modi dolor veniam.",
// "type": "CV",
// "likes_counts": 9,
// "dislikes_counts": 1,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\Community",
// "location_id": 59,
// "user_id": 1,
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T22:30:02.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "my _reaction_on_this_post is dislikes",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "20 hours ago",
// {
// "id": 92,
// "title": "Prof.",
// "content": "Est nesciunt fugit deserunt similique voluptatibus. Ipsam autem voluptatem sed. Saepe rerum vel id id iusto quo qui.",
// "type": "Job Opportunities",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-03T15:08:47.000000Z",
// "updated_at": "2023-08-03T15:08:47.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "20 hours ago",
// {
// "id": 93,
// "title": "Mr.",
// "content": "Totam labore dolorum distinctio impedit. Eaque et est ipsa earum dicta reiciendis ipsa maiores. Nostrum nam eos voluptatem fuga molestiae est nostrum.",
// "type": "Job Opportunities",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-03T15:08:47.000000Z",
// "updated_at": "2023-08-03T15:08:47.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "20 hours ago",
// {
// "id": 94,
// "title": "Mr.",
// "content": "Omnis non quasi odio impedit est quod. Error voluptas excepturi aut quae est maxime ut. Aut autem quaerat vero quo voluptatem eius consequuntur nostrum.",
// "type": "Job Opportunities",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-03T15:08:47.000000Z",
// "updated_at": "2023-08-03T15:08:47.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "20 hours ago",
// {
// "id": 95,
// "title": "Ms.",
// "content": "Hic aliquam inventore dolores quia animi. Dolorum modi et esse eum. Iste ut esse a.",
// "type": "Job Opportunities",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-03T15:08:47.000000Z",
// "updated_at": "2023-08-03T15:08:47.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "34 minutes ago",
// {
// "id": 104,
// "title": "vsv",
// "content": "cc",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T10:47:00.000000Z",
// "updated_at": "2023-08-04T10:47:00.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "34 minutes ago",
// {
// "id": 105,
// "title": "naser",
// "content": "flutter fornt-end developer",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T10:47:27.000000Z",
// "updated_at": "2023-08-04T10:47:27.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "32 minutes ago",
// {
// "id": 106,
// "title": "naser",
// "content": "flutter fornt-end developer",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T10:49:08.000000Z",
// "updated_at": "2023-08-04T10:49:08.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "32 minutes ago",
// {
// "id": 107,
// "title": "naser",
// "content": "flutter fornt-end developer1",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T10:49:13.000000Z",
// "updated_at": "2023-08-04T10:49:13.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "31 minutes ago",
// {
// "id": 108,
// "title": "naser",
// "content": "flutter fornt-end developer1",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T10:50:17.000000Z",
// "updated_at": "2023-08-04T10:50:17.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "4 minutes ago",
// {
// "id": 109,
// "title": "naser",
// "content": "flutter fornt-end developer1",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T11:17:19.000000Z",
// "updated_at": "2023-08-04T11:17:19.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "3 minutes ago",
// {
// "id": 110,
// "title": "naser",
// "content": "flutter fornt-end developer1",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T11:18:51.000000Z",
// "updated_at": "2023-08-04T11:18:51.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [
// "http:/media/8/List-of-Products-for-store.png"
// ],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "1 minutes ago",
// {
// "id": 111,
// "title": "naser",
// "content": "flutter fornt-end developer1",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T11:20:26.000000Z",
// "updated_at": "2023-08-04T11:20:26.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "1 minutes ago",
// {
// "id": 112,
// "title": "naser",
// "content": "flutter fornt-end developer3",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T11:20:29.000000Z",
// "updated_at": "2023-08-04T11:20:29.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [],
// "you have no reaction on this post ",
// null
// ],
// [
// "Eladio Dickinson",
// [],
// "under_graduate_ years_as_expert = 2",
// "1 minutes ago",
// {
// "id": 113,
// "title": "naser",
// "content": "flutter fornt-end developer3",
// "type": "Regular",
// "likes_counts": 0,
// "dislikes_counts": 0,
// "reports_number": 0,
// "Approvals_counter": 0,
// "location_type": "App\\Models\\User",
// "location_id": 1,
// "user_id": 1,
// "created_at": "2023-08-04T11:20:55.000000Z",
// "updated_at": "2023-08-04T11:20:55.000000Z",
// "user": {
// "id": 1,
// "first_name": "Eladio",
// "last_name": "Dickinson",
// "user_identifier": null,
// "birth_date": "1990-06-17",
// "email": "annamae46@example.org",
// "email_verified_at": "2023-08-02T16:11:00.000000Z",
// "phone_number": "51361412",
// "current_location": "Dedrick Hoppe",
// "programming_age": "1994-08-02",
// "gender": "male",
// "bio": "Bla Bla Bla",
// "country": "Syria",
// "created_at": "2023-08-02T16:11:00.000000Z",
// "updated_at": "2023-08-03T14:03:22.000000Z"
// }
// },
// [
// "http://127.0.0.1/media/9/List-of-Products-for-store.png"
// ],
// "you have no reaction on this post ",
// null
// ]
// ]    }
// })