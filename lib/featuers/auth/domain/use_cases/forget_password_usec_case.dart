

import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/domain/repositories/auth_repositories.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository ;


  ForgetPasswordUseCase({required this.repository});


  Future<Either<Failure,Unit>> call({required String email, }) async {
     return await repository.forgetPassword(email: email);
  }



}