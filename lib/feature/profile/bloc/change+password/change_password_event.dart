import 'package:ride_application/core/domain/model/auth/change_password.dart';

class ChangePasswordEvent {}

class ChangePasswordSuccessEvent extends ChangePasswordEvent {
  final ChangePasswordModel changePasswordModel;

  ChangePasswordSuccessEvent({required this.changePasswordModel});
}

class PasswordEvent extends ChangePasswordEvent {
  final bool isScreat;

  PasswordEvent(this.isScreat);
}
