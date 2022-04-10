import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/core/injection_container.dart';
import 'package:test_mvvm/data/remote/network/NetworkApiService.dart';
import 'package:test_mvvm/repository/photos/PhotoRepoImp.dart';
import 'package:test_mvvm/repository/posts/PostRepoImp.dart';
import 'package:test_mvvm/res/AppContextExtension.dart';
import 'package:test_mvvm/routes.dart';
import 'package:test_mvvm/view/detail/DetailSc.dart';
import 'package:test_mvvm/view/home/HomeSc.dart';
import 'package:test_mvvm/view_model/detail/DetailViewModel.dart';
import 'package:test_mvvm/view_model/home/HomeViewModel.dart';

void main() {
  init1();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create:(context) =>  HomeViewModel(
              myRepo: sl<PhotoRepoImp>()
            ),
          child: const HomeSc(),

      ),
        ChangeNotifierProvider(
         create:(context) => DetailViewModel(
             myRepo: sl<PostRepoImp>()),
          child: const DetailSc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: context.resources.color.colorPrimary,
        ),
        initialRoute: HomeSc.id,
        onGenerateRoute: AppRouter.onGenerateRoute,



      ),
    );
  }
}

