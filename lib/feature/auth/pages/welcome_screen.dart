import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_assets.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/share/custom_button.dart';
import 'package:ride_application/feature/share/sized_box.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox_Height(
            height: 50.h,
          ),
          Center(
            child: Image.asset(
              AppAssets.welcome,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox_Height(height: 39.h),
          Text(
            AppStrings.welcome,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox_Height(height: 15.h),
          Text(
            AppStrings.welcometext,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed('signup');
            },
            text: AppStrings.creataccount,
            background: AppColor.primary,
            textcolor: AppColor.white,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              text: AppStrings.login,
              textcolor: AppColor.primary,
            ),
          ),
          SizedBox_Height(height: 30.h)
        ],
      ),
    ));
  }
}
