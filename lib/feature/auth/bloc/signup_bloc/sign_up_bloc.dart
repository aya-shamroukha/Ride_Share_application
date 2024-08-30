import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/domain/service/auth_service.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool isPassword = true;
  bool isPassword2 = true;
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSuccess>((event, emit) async {
      emit(SignUpLoadingState());
      final isSuccess = await AuthServiceImpl().signUp(event.signUpModel);
      if (isSuccess) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpFailedState());
      }
    });
    on<PasswordEvent>(
      (event, emit) {
        isPassword = !isPassword;
        emit(PasswordState());
      },
    );
    on<ConfirmPasswordEvent>(
      (event, emit) {
        isPassword2 = !isPassword2;
        emit(ConfirmPasswordState());
      },
    );
  }
}
