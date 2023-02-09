part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed(this.email, this.password);
}

class LoginTest extends LoginEvent {
  final String email;
  final String password;

  LoginTest(this.email, this.password);
}
