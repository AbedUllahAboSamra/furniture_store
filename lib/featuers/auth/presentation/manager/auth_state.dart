part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}


class ChangedValueSaveLoginState extends AuthState {
  @override
  List<Object> get props => [];
}
class ChangingValueSaveLoginState extends AuthState {
  @override
  List<Object> get props => [];
}

class ChangedValueAgreeState extends AuthState {
  @override
  List<Object> get props => [];
}
class ChangingValueAgreeState extends AuthState {
  @override
  List<Object> get props => [];
}
