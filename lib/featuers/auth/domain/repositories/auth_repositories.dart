import 'package:dartz/dartz.dart';
import 'package:furniture_store/featuers/auth/domain/entities/user.dart';

import '../../../../core/error/failuers.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp(
      {required User user});

  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> forgetPassword({
    required String email,
  });
}
