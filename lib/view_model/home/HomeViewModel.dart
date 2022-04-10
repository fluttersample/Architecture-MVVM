

import 'package:test_mvvm/core/AppProvider.dart';
import 'package:test_mvvm/data/remote/response/ApiResponse.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/repository/photos/PhotoRepoImp.dart';

class HomeViewModel extends AppProvider
{
  final PhotoRepoImp _myRepo ;
  HomeViewModel({required PhotoRepoImp myRepo}) : _myRepo = myRepo;



  ApiResponse<List<PhotoModel>> photoMain =ApiResponse.loading();

  void _setPhotoMain(ApiResponse<List<PhotoModel>> response)
  {
    photoMain =response;
    notifyListeners();
  }

  Future<void> fetchMovies()async{
    print("SADDDDDDD");
    _setPhotoMain(ApiResponse.loading());
    _myRepo.getListPhotos()
    .then((value) {

      return _setPhotoMain(ApiResponse.completed(value));

    }).onError((error, stackTrace) => _setPhotoMain(ApiResponse.error
      (error.toString())));
  }

}