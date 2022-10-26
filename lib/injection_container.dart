import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_store/core/network/network.dart';
import 'package:furniture_store/featuers/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:furniture_store/featuers/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:furniture_store/featuers/auth/data/repositories/auth_repositories_impl.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';
import 'package:furniture_store/featuers/auth/domain/use_cases/forget_password_usec_case.dart';
import 'package:furniture_store/featuers/auth/domain/use_cases/login_use_case.dart';
import 'package:furniture_store/featuers/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:furniture_store/featuers/auth/presentation/manager/auth_bloc.dart';
import 'package:furniture_store/featuers/main/data/datasources/remote/main_remote_data_source.dart';
import 'package:furniture_store/featuers/main/data/repository/main_repository_impl.dart';
import 'package:furniture_store/featuers/main/domain/repository/main_repository.dart';
import 'package:furniture_store/featuers/main/domain/use_cases/get_current_location_use_case.dart';
import 'package:furniture_store/featuers/main/presentation/manager/main_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => AuthBloc(
        signUpUseCase: sl<SignUpUseCase>(),
        loginUseCase: sl<LoginUseCase>(),
      ));
  sl.registerFactory(() => MainBloc(
      getCurrentLocationUseCase: sl<GetCurrentLocationUseCase>()
      ));

  //UseCase
  sl.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(repository: sl<AuthRepository>()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: sl<AuthRepository>()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl<AuthRepository>()));

  sl.registerLazySingleton<GetCurrentLocationUseCase>(
      () => GetCurrentLocationUseCase(repository: sl<MainRepository>()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoriesImpl(
        localDataSource: sl<AuthLocalDataSource>(),
        remoteDataSource: sl<AuthRemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ));

  sl.registerLazySingleton<MainRepository>(() =>MainRepositoryImpl(networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<MainRemoteDataSource>()) );
  //DataSource

  sl.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        auth: sl<FirebaseAuth>(),
        fireStore: sl<FirebaseFirestore>(),
      ));
    //--

  sl.registerLazySingleton<MainRemoteDataSource>(() =>MainRemoteDataSourceImpl() );
  // Core !
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  // fireBase

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
