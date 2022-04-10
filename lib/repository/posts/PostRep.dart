

import 'package:test_mvvm/models/PostModel.dart';

abstract class PostRep{

  Future<void> sendPost(PostModel data);
}