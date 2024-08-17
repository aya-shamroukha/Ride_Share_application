import 'package:ride_application/core/resources/app_assets.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_string.dart';
import 'package:ride_application/feature/onBoarding/onBoarding.dart';

class OnBoradingModel {
  final dynamic imagPath;
  final String title;
  final String subtitle;

  OnBoradingModel(
      {required this.imagPath, required this.title, required this.subtitle});
  static List<OnBoradingModel> onBoradingScreen = [
    OnBoradingModel(
        imagPath: AppAssets.on1,
        title: AppStrings.onBoardingTitel1,
        subtitle: AppStrings.onBoardingsub1),
    OnBoradingModel(
        imagPath: AppAssets.on2,
        title: AppStrings.onBoardingTitel2,
        subtitle: AppStrings.onBoardingsub2),
    OnBoradingModel(
        imagPath: AppAssets.on3,
        title: AppStrings.onBoardingTitel3,
        subtitle: AppStrings.onBoardingsub3)
  ];
}
final pages = [
      OnBoardingWidget(
        color: AppColor.white,
        image: OnBoradingModel.onBoradingScreen[0].imagPath,
        title: OnBoradingModel.onBoradingScreen[0].title,
        subtitle: OnBoradingModel.onBoradingScreen[0].subtitle,
      ),
      OnBoardingWidget(
        color: AppColor.lightgreen.withOpacity(0.4),
        image: OnBoradingModel.onBoradingScreen[1].imagPath,
        title: OnBoradingModel.onBoradingScreen[1].title,
        subtitle: OnBoradingModel.onBoradingScreen[1].subtitle,
      ),
      OnBoardingWidget(
        color: AppColor.lightgreen.withOpacity(0.7),
        image: OnBoradingModel.onBoradingScreen[2].imagPath,
        title: OnBoradingModel.onBoradingScreen[2].title,
        subtitle: OnBoradingModel.onBoradingScreen[2].subtitle,
      )
    ];