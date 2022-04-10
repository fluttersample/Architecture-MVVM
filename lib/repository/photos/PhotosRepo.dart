
import 'package:test_mvvm/models/photoModel.dart';

abstract class PhotoRepo{

  Future<List<PhotoModel>> getListPhotos();
}