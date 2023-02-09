part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupPressed extends SignupEvent {
  final String email;
  final String password;

  SignupPressed(this.email, this.password);
}
