import 'package:furniture_store/featuers/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:furniture_store/featuers/auth/data/repositories/auth_repositories_impl.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;




Future<void> init() async {


  //bloc
  sl.registerFactory(() => AuthBloc());


  //use case


  //repository



  //data source

  sl.registerLazySingleton<AuthLocalDataSource>(
          () => AuthLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));


  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

}