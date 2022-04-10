


import 'package:flutter/material.dart';
import 'package:test_mvvm/models/photoModel.dart';
import 'package:test_mvvm/view/detail/DetailSc.dart';

import 'view/home/HomeSc.dart';

class AppRouter {

 static Route? onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case HomeSc.id:
        return MaterialPageRoute(
            builder: (_) =>
            const  HomeSc(),);
      case DetailSc.id:
        return MaterialPageRoute(builder: (context) =>
           DetailSc(
              photoData:
           settings.arguments
              as PhotoModel),);

      default:
        return null;
    }
  }
}