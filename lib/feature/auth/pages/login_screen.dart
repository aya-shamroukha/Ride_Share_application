import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/domain/model/auth/login_model.dart';
import 'package:ride_application/core/resources/app_assets.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/auth/bloc/login_bloc/log_in_bloc.dart';
import 'package:ride_application/feature/auth/bloc/login_bloc/log_in_event.dart';
import 'package:ride_application/feature/auth/bloc/login_bloc/log_in_state.dart';
import 'package:ride_application/feature/share/custom_loading_button.dart';
import 'package:ride_application/feature/share/custom_text_field.dart';
import 'package:ride_application/feature/share/sized_box.dart';

import '../../share/custom_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => LogInBloc(),
              child: BlocBuilder<LogInBloc, LogInState>(
                builder: (context, state) {
                  var loginbloc = BlocProvider.of<LogInBloc>(context);

                  return Form(
                    key: loginbloc.formkey,
                    child: Column(
                      children: [
                        SizedBox_Height(
                          height: 30.h,
                        ),
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
                        Center(
                            child: Image.asset(
                          AppAssets.welcome,
                          fit: BoxFit.cover,
                        )),
                        SizedBox_Height(
                          height: 50.h,
                        ),
                        CustomTextfield(
                          labeltext: AppStrings.phone,
                          controller: loginbloc.phone,
                        ),
                        SizedBox_Height(
                          height: 10.h,
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
                          controller: loginbloc.password,
                          isScreat: loginbloc.isPassword,
                          suffixicon: IconButton(
                              onPressed: () {
                                context
                                    .read<LogInBloc>()
                                    .add(PasswordEvent(loginbloc.isPassword));
                              },
                              icon: loginbloc.isPassword == true
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: AppColor.primary,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: AppColor.primary,
                                    )),
                        ),
                        SizedBox_Height(height: 100.h),
                        state is LogInLoadingState
                            ? const Loading()
                            : CustomButton(
                                onPressed: () {
                                  if (BlocProvider.of<LogInBloc>(context)
                                      .formkey
                                      .currentState!
                                      .validate()) {
                                    context.read<LogInBloc>().add(LogInSuccess(
                                        LogInModel(loginbloc.password.text,
                                            loginbloc.phone.text)));

                                    Navigator.of(context)
                                        .pushReplacementNamed('bottom');
                                  }
                                },
                                text: AppStrings.login,
                                background: AppColor.primary,
                              )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
