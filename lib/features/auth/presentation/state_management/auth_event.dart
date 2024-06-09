part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpButtonPressed extends AuthEvent {
  final String email;
  final String userName;
  final String password;
  final String rePassword;

  SignUpButtonPressed({required this.email,
    required this.userName,
    required this.password,
    required this.rePassword,
  });
}

class SignInButtonPressed extends AuthEvent {
  final String email;
  final String password;

  SignInButtonPressed({required this.email, required this.password});
}
class SignOutButtonPressed extends AuthEvent {}

class AuthWithGooglePressed extends AuthEvent {}

class SwitchSignInSignUpButtonPressed extends AuthEvent {}
class PasswordMatch extends AuthEvent {
  final String password;
  final String rePassword;
  PasswordMatch({required this.rePassword, required this.password});
}

