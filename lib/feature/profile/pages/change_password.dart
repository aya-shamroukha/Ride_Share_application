import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/domain/model/auth/change_password.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/profile/bloc/change+password/change_password_bloc.dart';
import 'package:ride_application/feature/profile/bloc/change+password/change_password_event.dart';
import 'package:ride_application/feature/profile/bloc/change+password/change_password_state.dart';
import 'package:ride_application/feature/share/custom_button.dart';
import 'package:ride_application/feature/share/custom_loading_button.dart';
import 'package:ride_application/feature/share/custom_text_field.dart';
import 'package:ride_application/feature/share/sized_box.dart';
import 'package:ride_application/feature/share/toast.dart';

import '../../../core/resources/app_color.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: SafeArea(
          child: Scaffold(
        body: SizedBox(
          child: SingleChildScrollView(
            child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordSuccessState) {
                  showTost(
                      message: AppStrings.changepassworddone,
                      state: ToastState.success);
                } else if (state is ChangePasswordFailedState) {
                  showTost(
                      message: AppStrings.changepasswordfailed,
                      state: ToastState.error);
                }
              },
              builder: (context, state) {
                var changebloc = BlocProvider.of<ChangePasswordBloc>(context);
                return Form(
                  key: changebloc.change,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox_Height(height: 20.w),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            AppStrings.back,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox_width(width: 50.w),
                        ],
                      ),
                      SizedBox_Height(height: 40.h),

                      Center(
                        child: Text(
                          AppStrings.setPassword,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox_Height(height: 10.h),
                      Text(
                        AppStrings.changePassword,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox_Height(height: 50.h),

                      //!password
                      CustomTextfield(
                        validate: (val) {
                          if (val!.length < 8) {
                            return AppStrings.passwordlenght;
                          }
                          return null;
                        },
                        labeltext: AppStrings.password,
                        controller: changebloc.password,
                        isScreat: changebloc.isPassword,
                        suffixicon: IconButton(
                            onPressed: () {
                              context
                                  .read<ChangePasswordBloc>()
                                  .add(PasswordEvent(changebloc.isPassword));
                            },
                            icon: changebloc.isPassword == true
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.primary,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColor.primary,
                                  )),
                      ),
                      //!newpassword
                      CustomTextfield(
                        validate: (val) {
                          if (val!.length < 8) {
                            return AppStrings.passwordlenght;
                          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(val)) {
                            return AppStrings.passwordchar;
                          } else if (!RegExp(r'[A-Z]').hasMatch(val)) {
                            return AppStrings.passwordupper;
                          }
                          return null;
                        },
                        labeltext: AppStrings.newpassword,
                        controller: changebloc.newpassword,
                        isScreat: changebloc.isPassword,
                      ), //!confirmPassword
                      CustomTextfield(
                        labeltext: AppStrings.confirmpassword,
                        controller: changebloc.confirmpassword,
                        validate: (val) {
                          if (changebloc.confirmpassword.text !=
                              changebloc.newpassword.text) {
                            return AppStrings.passwordisnotidentical;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox_Height(height: 40.h),
                      state is ChangePasswordLoadingState
                          ? const Loading()
                          : CustomButton(
                              onPressed: () {
                                if (BlocProvider.of<ChangePasswordBloc>(context)
                                    .change
                                    .currentState!
                                    .validate()) {
                                  context.read<ChangePasswordBloc>().add(
                                      ChangePasswordSuccessEvent(
                                          changePasswordModel:
                                              ChangePasswordModel(
                                                  currentPassword: changebloc
                                                      .password.text
                                                      .toString(),
                                                  newPassword: changebloc
                                                      .newpassword.text
                                                      .toString(),
                                                  confirmPassword: changebloc
                                                      .confirmpassword.text
                                                      .toString())));
                                }
                              },
                              text: AppStrings.changePassword,
                              background: AppColor.primary,
                            )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
