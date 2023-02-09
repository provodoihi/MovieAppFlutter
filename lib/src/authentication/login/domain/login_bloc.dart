import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/src/authentication/data/userCredentialModel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(): super(LoginInitial()) {
    on<LoginPressed>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 1));

      var box = Hive.box('SignupCredential');
      try {
        UserCredential data = box.get(event.email);

        if (data.email == event.email && data.password == event.password) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailed("Login failed. Please try again"));
        }
      } catch (e) {
        emit(LoginFailed("Login failed. Please try again"));
      }
    });

    on<LoginTest>((event, emit) async {
      var box = Hive.box('SignupCredential');
      try {
        UserCredential data = box.get(event.email);
        print('Data ${data.email}');
      } catch (e) {
        print('Data null');
      }
    });
  }
}
