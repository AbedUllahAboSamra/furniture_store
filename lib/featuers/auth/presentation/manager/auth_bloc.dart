import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/auth/domain/use_cases/login_use_case.dart';
import 'package:furniture_store/featuers/auth/domain/use_cases/sign_up_use_case.dart';

import '../../../../core/error/messages.dart';
import '../../domain/entities/user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  static AuthBloc get(context) => BlocProvider.of(context);

  bool isSaveLogin = true;
  bool isAgreeToTerms = true;

  AuthBloc({
    required this.loginUseCase,
    required this.signUpUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        final userOfFailure = await loginUseCase.call(
            email: event.email, password: event.password);
        userOfFailure.fold(
          (failure) {
            emit(LoginErrorState(message: _mapFailureToMessage(failure)));
          },
          (user) {
            emit(LoginLoadedState());
          },
        );
      } else if (event is ChangeIsLoginEvent) {
        emit(ChangeingIsLoginState());
        isSaveLogin = event.value;
        emit(ChangeIsLoginState());
      } else if (event is ChangeIsAgreeToTermsEvent) {
        emit(ChangeingIsLoginState());
        isAgreeToTerms = event.value;
        emit(ChangeIsLoginState());
      } else if (event is SignUpEvent) {
        print(state);
        emit(SignUpLoadingState());
        print(state);
        final userOfFailure = await signUpUseCase.call(user: event.user);
        userOfFailure.fold(
          (failure) {

            emit(LoginErrorState(message: _mapFailureToMessage(failure)));
            print(state);          },
          (user) {
            emit(SignUpLoadedState());
            print(state);},
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
