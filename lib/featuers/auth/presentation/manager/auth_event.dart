part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;

  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final User user;
  SignUpEvent({
    required this.user
});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// change Is Login value

class ChangeIsLoginEvent extends AuthEvent {
  final bool value;

  const ChangeIsLoginEvent({required this.value});

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

// change term
class ChangeIsAgreeToTermsEvent extends AuthEvent {
  final bool value;

  const ChangeIsAgreeToTermsEvent({required this.value});

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}
