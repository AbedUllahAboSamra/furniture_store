import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/exceptions.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/data/model/user_model.dart';
import 'package:furniture_store/featuers/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {

  Future<Either<Failure, UserModel>> getUserData();
  Future<Either<Failure, bool>> setUserData({required UserModel user});
}

const String IsShown = "IsShown";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthLocalDataSourceImpl({required this.sharedPreferences});



  @override
  Future<Either<Failure, UserModel>> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> setUserData({required UserModel user}) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }
}
