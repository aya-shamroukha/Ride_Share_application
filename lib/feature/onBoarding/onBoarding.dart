// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/domain/model/onBoarding/onboarding_model.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = LiquidController();

    int currentPage = 0;
    onPageChange(int activeindex) {
      setState(() {
        currentPage = activeindex;
      });
      // ignore: avoid_print
      print(currentPage);
    }

    return Scaffold(
      body: SafeArea(
        child: LiquidSwipe.builder(
          ignoreUserGestureWhileAnimating: true,
          waveType: WaveType.liquidReveal,
          itemCount: OnBoradingModel.onBoradingScreen.length,
          liquidController: controller,
          enableLoop: false,
          preferDragFromRevealedArea: true,

          enableSideReveal: false,
          onPageChangeCallback: onPageChange,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            color: AppColor.primary,
          ),
          // enableSideReveal: true,
          itemBuilder: (context, index) {
            return Stack(alignment: Alignment.center, children: [
              Container(
                color: Colors.white, // Ensure each page has a background color
                child: pages[index],
              ),

              // Stack(alignment: Alignment.center, children: [
              //   pages[index],
              //!skip text
              Positioned(
                top: 0,
                right: 0,
                child: index != 2
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(AppStrings.skip,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 12,
                                      color: AppColor.titlecolor)),
                          onPressed: () {
                            controller.jumpToPage(page: 2);
                          },
                        ),
                      )
                    : SizedBox(
                        height: 50.h,
                      ),
              ),

              Positioned(
                  bottom: 30.h,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: AppColor.primary,
                        side: BorderSide(color: AppColor.primary),
                        padding: const EdgeInsets.all(20)),
                    child: index != 2
                        ? const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColor.white,
                          )
                        : const Text(
                            AppStrings.go,
                            style: TextStyle(color: AppColor.white),
                          ),
                    onPressed: () async {
                      await getIt
                          .get<SharedPreferences>()
                          .setBool('onboarding', true)
                          .then((value) {
                        int nextPage = controller.currentPage + 1;
                        index != 2
                            ? controller.animateToPage(page: nextPage)
                            : Navigator.of(context)
                                .pushReplacementNamed('welcome');
                      });
                    },
                  ))
            ]);
          },
        ),
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: 90.h,
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40.h,
          ),
          Column(
            children: [
              //!title
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColor.titlecolor)),

              //!subTitle
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 14, color: AppColor.textcolor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
