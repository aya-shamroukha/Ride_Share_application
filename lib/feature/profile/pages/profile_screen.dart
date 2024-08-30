import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/profile/widget/containerForProfile.dart';
import 'package:ride_application/feature/share/sized_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox_Height(height: 30.h),
            Center(
              child: Text(
                AppStrings.profile,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox_Height(height: 30.h),
            ContainerForProfile(
              onPressed: () {
                Navigator.of(context).pushNamed('changePassword');
              },
              text: AppStrings.changePassword,
            ),
            ContainerForProfile(
              onPressed: () {
                Navigator.of(context).pushNamed('policy');
              },
              text: AppStrings.policy,
            ),
          ],
        ),
      ),
    );
  }
}
