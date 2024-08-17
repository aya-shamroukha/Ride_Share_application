// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/resources/app_assets.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    bool isVisited =
        getIt.get<SharedPreferences>().getBool('onboarding') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      isVisited
          ? Navigator.of(context).pushReplacementNamed("welcome")
          : Navigator.of(context).pushReplacementNamed("onboarding");
    });
    Future.delayed(const Duration(seconds: 3), () async {
      getIt.get<SharedPreferences>().getString('token') == null
          ? Navigator.of(context).pushReplacementNamed("welcome")
          : Navigator.of(context).pushReplacementNamed("bottom");
      //GoRouter.of(context).go(Routes().changeLang);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(AppAssets.car1)),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
