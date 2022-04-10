
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_mvvm/data/remote/AppException.dart';
import 'package:test_mvvm/data/remote/network/ApiEndPoints.dart';
import 'package:test_mvvm/data/remote/network/BaseApiService.dart';

class NetworkApiService extends BaseApiService{


  @override
  Future getResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(baseUrl + ApiEndPoints.getPhotos));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' ' with status code '
                ': ${response.statusCode}');
    }
  }

  @override
  Future sendPost(String url,dynamic data)async {
    dynamic responseJson;
    try{
      print(jsonEncode(data));
      final response = await http.post(
          Uri.parse(baseUrl +
          ApiEndPoints.postPosts),
      headers:  {"Content-Type": 'application/json; charset=UTF-8'},
      body: jsonEncode(data));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


}