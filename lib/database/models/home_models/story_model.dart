import 'dart:convert';

class StoryUserModel {

  String profileUrl;
  String name;
  List<StoryModel> stories;
  StoryUserModel(
      {required this.profileUrl, required this.name, required this.stories});
}

class StoryModel {
  String imageUrl;
  StoryModel({
    required this.imageUrl,
  });
}

final dataUsers = [
  StoryUserModel(
      stories: [
        StoryModel(
            imageUrl:
            "https://cdn.motor1.com/images/mgl/WBwMO/s1/lanzamiento-toyota-land-cruiser-300-2022.webp"),
        StoryModel(
            imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRegnnd76Vb4BgI5SbNMNuaV7Y3-NOMY5sCYtvqqU89iBNWEYGZimdJoKWzZM_JTP0ztvE&usqp=CAU")
      ],
      profileUrl:
      'https://watermark.lovepik.com/photo/50147/3260.jpg_wh1200.jpg',
      name: 'Mhd Mihdi'
  ),
  StoryUserModel(
      stories: [
        StoryModel(
            imageUrl:
            "https://cdn.motor1.com/images/mgl/WBwMO/s1/lanzamiento-toyota-land-cruiser-300-2022.webp"),
        StoryModel(
            imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRegnnd76Vb4BgI5SbNMNuaV7Y3-NOMY5sCYtvqqU89iBNWEYGZimdJoKWzZM_JTP0ztvE&usqp=CAU")
      ],
      profileUrl:
      'https://img.youm7.com/ArticleImgs/2018/8/16/56018-%D8%A8%D8%A7%D8%B3%D9%85-%D9%8A%D8%A7%D8%AE%D9%88%D8%B1-(5).jpg',
      name: 'raieeeeeee'
  ),


];

/////////////////////naser model

// To parse this JSON data, do
//
//     final welcomeStroies = welcomeStroiesFromJson(jsonString);


WelcomeStroies welcomeStroiesFromJson(String str) => WelcomeStroies.fromJson(json.decode(str));

String welcomeStroiesToJson(WelcomeStroies data) => json.encode(data.toJson());

class WelcomeStroies {
  List<List<dynamic>> data;

  WelcomeStroies({
    required this.data,
  });

  factory WelcomeStroies.fromJson(Map<String, dynamic> json) => WelcomeStroies(
    data: List<List<dynamic>>.from(json["data"].map((x) => List<dynamic>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
