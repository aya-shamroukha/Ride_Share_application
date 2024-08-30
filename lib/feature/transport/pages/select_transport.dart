import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_assets.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/feature/share/sized_box.dart';

import '../../../core/resources/app_string.dart';
import '../widget/transport_card.dart';

class SelectTransport extends StatelessWidget {
  const SelectTransport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SizedBox_Height(height: 10.h),
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
            Text(
              AppStrings.selecttransport,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColor.blacktext),
            ),
          ],
        ),
        SizedBox_Height(height: 30.h),
        Text(
          AppStrings.selectyourtransport,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.textcolor),
        ),
        SizedBox_Height(height: 40.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transportcard(
                image: AppAssets.car,
                text: AppStrings.car,
                ontap: () {},
              ),
              Transportcard(
                text: AppStrings.bike,
                image: AppAssets.bike,
                ontap: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transportcard(
                image: AppAssets.cycle,
                text: AppStrings.cycle,
                ontap: () {
                  Navigator.of(context).pushNamed('getAllBicycle');
                },
              ),
              Transportcard(
                text: AppStrings.taxi,
                image: AppAssets.taxi,
                ontap: () {},
              ),
            ],
          ),
        )
      ],
    )));
  }
}
