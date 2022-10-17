part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

// login states
class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;

  const LoginErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

//change value save login
class ChangeIsLoginState extends AuthState {}

class ChangeingIsLoginState extends AuthState {}

// create account states

class SignUpLoadingState extends AuthState {}

class SignUpLoadedState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String message;

  const SignUpErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
