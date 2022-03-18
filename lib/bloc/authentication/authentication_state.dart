part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}


class RegisterInitial extends AuthenticationState {}

class RegisterSuccessState extends AuthenticationState {
  final AuthenticationHub registerHub;

  RegisterSuccessState(this.registerHub);
}

class RegisterErrorState extends AuthenticationState {
  final error;

  RegisterErrorState(this.error);
}

class RegisterLoadingState extends AuthenticationState {}


class LoginSuccessState extends AuthenticationState {
  final AuthenticationHub registerHub;

  LoginSuccessState(this.registerHub);
}

class LoginErrorState extends AuthenticationState {
  final error;

  LoginErrorState(this.error);
}

class LoginLoadingState extends AuthenticationState {}
