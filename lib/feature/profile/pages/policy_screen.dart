import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/profile/bloc/policy_bloc/policy_bloc.dart';
import 'package:ride_application/feature/profile/bloc/policy_bloc/policy_event.dart';
import 'package:ride_application/feature/profile/bloc/policy_bloc/policy_state.dart';
import 'package:ride_application/feature/share/sized_box.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PolicyBloc()..add(PolicySuccessEvent()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox_Height(height: 20.h),
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
              Center(
                child: Text(
                  AppStrings.policy,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox_Height(height: 30.h),
              BlocBuilder<PolicyBloc, PolicyState>(
                builder: (context, state) {
                  if (state is PolicySuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.policyModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: AppColor.titlecolor),
                          ),
                          SizedBox_Height(height: 20.h),
                          Text(
                            state.policyModel.description,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: AppColor.naturalGrey,
                                ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
