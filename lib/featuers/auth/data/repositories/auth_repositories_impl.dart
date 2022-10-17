import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/exceptions.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:furniture_store/featuers/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/network/network.dart';
import '../../domain/entities/user.dart';
import '../model/user_model.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const AuthRepositoriesImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    // TODO: implement signIn

    bool isConnected = await networkInfo.isConnected;
    print("$isConnected isConnected");
    if (isConnected) {
      try {
        UserModel user =
            await remoteDataSource.signInUser(email: email, password: password);
        localDataSource.setUserData(user: user);
        return Right(user);
      } on ServerErrorExceotion {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUp({required User user}) async {
    // TODO: implement signUp
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        UserModel usr = UserModel(
            id: user.id,
            fullName: user.fullName,
            email: user.email,
            phone: user.phone,
            country: user.country,
            password: user.password,
            imageUrl: user.imageUrl);
        UserModel usera = await remoteDataSource.signUpUser(user: usr);

        localDataSource.setUserData(user: usr);
        return Right(usr);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
