



import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/domain/entities/user.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';

class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase({
    required this.repository
});


  Future<Either<Failure,User>> call({
  required String email,
  required String password,

})async{

    return await repository.signIn(email: email, password: password);
  }


}