import 'package:get_it/get_it.dart';
import 'package:test_mvvm/data/remote/network/BaseApiService.dart';
import 'package:test_mvvm/data/remote/network/NetworkApiService.dart';
import 'package:test_mvvm/repository/photos/PhotoRepoImp.dart';
import 'package:test_mvvm/repository/photos/PhotosRepo.dart';
import 'package:test_mvvm/repository/posts/PostRep.dart';
import 'package:test_mvvm/repository/posts/PostRepoImp.dart';


 final sl = GetIt.instance;

Future<void> init1() async {


  /// Repository
  sl.registerLazySingleton<PostRepoImp>(
    () => PostRepoImp(apiService: sl()));

  sl.registerLazySingleton<PhotoRepoImp>(
    () => PhotoRepoImp(apiService: sl()));

  ///network
  sl.registerLazySingleton<BaseApiService>
    (() => NetworkApiService());

  // Use cases
  // sl.registerLazySingleton(() => WeatherUseCase(wikiRepository: sl()));
  //
  // // Repository
  // sl.registerLazySingleton<WikiRepository>(
  //   () => WikiRepositoryImpl(
  //     wikiRemoteDataSource: sl(),
  //   ),
  // );
  //
  // sl.registerLazySingleton<IWeatherUseCase>(
  //   () => WeatherUseCase(
  //     wikiRepository: sl(),
  //   ),
  // );
  //
  // // Data sources
  // sl.registerLazySingleton<WikiRemoteDataSource>(
  //   () => WikiRemoteDataSourceImpl(),
  // );
}
