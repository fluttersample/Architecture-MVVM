

import 'package:test_mvvm/data/remote/network/ApiEndPoints.dart';
import 'package:test_mvvm/data/remote/network/BaseApiService.dart';
import 'package:test_mvvm/models/PostModel.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/repository/posts/PostRep.dart';

class PostRepoImp extends PostRep
{
  final BaseApiService _apiService;
  PostRepoImp({
    required BaseApiService apiService}) : _apiService=apiService;

  @override
  Future<void> sendPost(PostModel data) async{
    try{

      var response = await _apiService.sendPost(
        _apiService.baseUrl + ApiEndPoints.postPosts,
        data.toMap()
      );
      print(response);

    }catch(e)
    {
      print(e);
      rethrow;
    }
  }

}