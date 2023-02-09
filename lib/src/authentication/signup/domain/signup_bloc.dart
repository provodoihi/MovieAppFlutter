import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/src/authentication/data/userCredentialModel.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupPressed>((event, emit) async {
      try {
        emit(SignupLoading());

        var box = Hive.box('SignupCredential');
        var data = box.get(event.email);

        if (data.email == event.email) {
          throw Exception('Error');
        } else {
          await box.put(
            event.email,
            UserCredential(
              email: event.email,
              password: event.password,
            ),
          );
        }

        await Future.delayed(const Duration(seconds: 1));

        emit(SignupSuccess());
      } catch (e) {
        emit(SignupFailed("Signup failed. Please try again"));
      }
    });
  }
}
