


import 'dart:convert';

import 'package:test_mvvm/data/remote/network/ApiEndPoints.dart';
import 'package:test_mvvm/data/remote/network/BaseApiService.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/repository/photos/PhotosRepo.dart';

class PhotoRepoImp extends PhotoRepo{
  final BaseApiService _apiService ;

  PhotoRepoImp({required BaseApiService apiService}) : _apiService =apiService;

  @override
  Future<List<PhotoModel>> getListPhotos() async{
    try{
      List<dynamic> response = await
      _apiService.getResponse(_apiService.baseUrl+
          ApiEndPoints.getPhotos);

      final ps =response.map((e) =>
          PhotoModel.fromJson(e)).toList();
       return ps ;
    }catch(e)
    {
      print(e);
      rethrow;
    }
  }

}