part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {}

class AuthOutFailure extends AuthState {}
class AuthOutSuccess extends AuthState {}
class AuthOutLoading extends AuthState {}

class SwitchSignInSignOut extends AuthState {}

class PasswordIsMatch extends AuthState {}
class PasswordIsNotMatch extends AuthState {}





