import 'package:ride_application/core/domain/model/auth/signup_model.dart';

class SignUpEvent {}

class SignUpSuccess extends SignUpEvent {
  final SignUpModel signUpModel;

  SignUpSuccess(this.signUpModel);
}

class SignUpField extends SignUpEvent {}

class SignUpLoading extends SignUpEvent {}

class PasswordEvent extends SignUpEvent {
  final bool isScreat;

  PasswordEvent(this.isScreat);
}

class ConfirmPasswordEvent extends SignUpEvent {
  final bool isScreat;

  ConfirmPasswordEvent(this.isScreat);
}
