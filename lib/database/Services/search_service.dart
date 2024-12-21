import 'package:dev_space/database/models/searh_model.dart';
import 'package:dev_space/shared/components/constants.dart';
import 'package:dev_space/shared/network/local/cache_helper.dart';
import 'package:http/http.dart'as http;

class SearchService{

static Future search({required search})async
{
  String token = await CacheHelper.getData(key: 'token') ?? '';
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer 1|WpvzXtyhfa2VmHP9nCh2EUhhf3c227kqiEMGAbQT'
  };
  var request = http.MultipartRequest('POST', Uri.parse('${Constants.baseUrl}search'));
  request.fields.addAll({
    'type': 'user',
    'search': search
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  String stream=  await response.stream.bytesToString();
  print(stream);
  if (response.statusCode == 200||response.statusCode==201) {
    return searchModelFromJson(stream);
  }
  else {
    print(response.reasonPhrase);
  }

}

}