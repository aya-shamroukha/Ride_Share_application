import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/domain/service/auth_service.dart';
import 'package:ride_application/core/domain/service/profile_service.dart';

import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  GlobalKey<FormState> change = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool isPassword = false;
  bool isPassword2 = true;
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordSuccessEvent>((event, emit) async {
      emit(ChangePasswordLoadingState());
      try {
        var result = await ProfileServiceImpl()
            .changePassword(event.changePasswordModel);
        if (result is String) {
          emit(ChangePasswordSuccessState());
        }
      } catch (e) {
        emit(ChangePasswordFailedState());
      }
    });
    on<PasswordEvent>(
      (event, emit) {
        isPassword = !isPassword;
        emit(PasswordState());
      },
    );
  }
}
