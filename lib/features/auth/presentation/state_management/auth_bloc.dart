import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc({required this.authUseCase}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield AuthLoading();
      try {
        if (event.password == event.rePassword) {
          await authUseCase.signUpCall(event.email, event.password);
          await authUseCase.assignUserNameCall(event.userName);
          yield AuthSuccess();
          yield PasswordIsMatch();
        } else {
          yield AuthFailure();
          yield PasswordIsNotMatch();
        }
      } catch (_) {
        yield AuthFailure();
      }
    }
    if (event is SignInButtonPressed) {
      yield AuthLoading();
      try {
        await authUseCase.signInCall(event.email, event.password);
        yield AuthSuccess();
      } catch (_) {
        yield AuthFailure();
      }
    }
    if (event is AuthWithGooglePressed) {
      yield AuthLoading();
      try {
        await authUseCase.googleAuthCall();
        yield AuthSuccess();
      } catch (_) {
        yield AuthFailure();
      }
    }
    if (event is SignOutButtonPressed) {
      yield AuthOutLoading();
      try {
        await authUseCase.signOutCall();
        yield AuthOutSuccess();
      } catch (_) {
        yield AuthOutFailure();
      }
    }
    if (event is SwitchSignInSignUpButtonPressed) {
      yield SwitchSignInSignOut();
    }
    if (event is PasswordMatch) {
      if (event.password == event.rePassword) {
        yield PasswordIsMatch();
      } else {
        yield PasswordIsNotMatch();
      }
    }
  }
}
