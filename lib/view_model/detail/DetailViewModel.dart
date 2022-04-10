

import 'package:flutter/cupertino.dart';
import 'package:test_mvvm/core/AppProvider.dart';
import 'package:test_mvvm/data/remote/response/ApiResponse.dart';
import 'package:test_mvvm/models/PostModel.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/repository/posts/PostRepoImp.dart';

class DetailViewModel extends AppProvider
{

 final PostRepoImp _myRepo;
 DetailViewModel({required PostRepoImp myRepo}) : _myRepo = myRepo;
 TextEditingController controllerTitle = TextEditingController();
 TextEditingController controllerBody = TextEditingController();

 ApiResponse<PostModel> postModel = ApiResponse.init();

 void _setPhotoMain(ApiResponse<PostModel> model)
 {
  postModel = model;
  notifyListeners();
 }

 Future<void> sendData()async
 {
  final data = PostModel(
   title: controllerTitle.text,
   body: controllerBody.text,
   id: 1111,
   userId: 2222
  );
  _setPhotoMain(ApiResponse.loading());
  final result = await _myRepo.sendPost(data)
      .then((value) {
       _setPhotoMain(ApiResponse.completed(data));
  }).onError((error, stackTrace) {
   _setPhotoMain(ApiResponse.error(error.toString()));
  });
  print(result);
 }




}