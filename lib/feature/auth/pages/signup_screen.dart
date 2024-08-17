// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/domain/model/auth/signup_model.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/auth/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:ride_application/feature/auth/bloc/signup_bloc/sign_up_event.dart';
import 'package:ride_application/feature/auth/bloc/signup_bloc/sign_up_state.dart';
import 'package:ride_application/feature/share/custom_button.dart';
import 'package:ride_application/feature/share/custom_loading_button.dart';
import 'package:ride_application/feature/share/custom_text_field.dart';
import 'package:ride_application/feature/share/sized_box.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          var signupbloc = BlocProvider.of<SignUpBloc>(context);
          return SafeArea(
              child: Scaffold(
            body: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        AppStrings.signuptext,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox_Height(height: 30.h),
                      //!firstname
                      CustomTextfield(
                        labeltext: AppStrings.firstname,
                        controller: signupbloc.firstname,
                        validate: (val) {
                          if (val.isEmpty) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),
                      //!lastname
                      CustomTextfield(
                        labeltext: AppStrings.lastname,
                        controller: signupbloc.lastname,
                        validate: (val) {
                          if (val.isEmpty) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),
                      //!username
                      CustomTextfield(
                        labeltext: AppStrings.username,
                        controller: signupbloc.username,
                        validate: (val) {
                          if (val.isEmpty) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),
                      //!phone
                      CustomTextfield(
                        labeltext: AppStrings.phone,
                        controller: signupbloc.phone,
                      ),
                      //!password
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
                        labeltext: AppStrings.password,
                        controller: signupbloc.password,
                        isScreat: signupbloc.isPassword,
                        suffixicon: IconButton(
                            onPressed: () {
                              context
                                  .read<SignUpBloc>()
                                  .add(PasswordEvent(signupbloc.isPassword));
                            },
                            icon: signupbloc.isPassword == true
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.primary,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColor.primary,
                                  )),
                      ),
                      //!confirmPassword
                      CustomTextfield(
                        isScreat: signupbloc.isPassword2,
                        labeltext: AppStrings.confirmpassword,
                        controller: signupbloc.confirmpassword,
                        validate: (val) {
                          if (signupbloc.confirmpassword.text !=
                              signupbloc.password.text) {
                            return AppStrings.passwordisnotidentical;
                          } else {
                            return null;
                          }
                        },
                        suffixicon: IconButton(
                            onPressed: () {
                              context.read<SignUpBloc>().add(
                                  ConfirmPasswordEvent(signupbloc.isPassword2));
                            },
                            icon: signupbloc.isPassword2 == true
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.primary,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColor.primary,
                                  )),
                      ),
                      SizedBox_Height(height: 99.h),
                      state is SignUpLoadingState
                          ? const Loading()
                          : CustomButton(
                              onPressed: () {
                                context.read<SignUpBloc>().add(SignUpSuccess(
                                    SignUpModel(
                                        firstName: signupbloc.firstname.text,
                                        lastName: signupbloc.lastname.text,
                                        username: signupbloc.username.text,
                                        phone: signupbloc.phone.text,
                                        birthDate: "2024-08-10",
                                        password: signupbloc.password.text,
                                        confirmPassword:
                                            signupbloc.confirmpassword.text)));
                                Navigator.of(context)
                                    .pushReplacementNamed('bottom');
                                print('successsssssss');
                              },
                              text: AppStrings.signup,
                              background: AppColor.primary,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
