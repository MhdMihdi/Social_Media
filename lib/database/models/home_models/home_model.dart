class HomeModel
{
  String?message;
  HomeDataModel?data;

  HomeModel.fromJson(Map<String,dynamic>json)
  {
    message =json['message'];
    data=HomeDataModel.fromJson(json['data']);
  }




}
List<dynamic>posts=[];

class HomeDataModel{
  HomeDataModel.fromJson(Map<String,dynamic>json){
    

  }
}