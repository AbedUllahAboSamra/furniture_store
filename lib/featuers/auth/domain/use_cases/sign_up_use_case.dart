

import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/domain/entities/user.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';

class SignUpUseCase {

  final AuthRepository repository ;
  const SignUpUseCase({
    required this.repository,
});

  Future<Either<Failure , User>> call({required User user}) async{
    return await repository.signUp(user: user);
  }
}