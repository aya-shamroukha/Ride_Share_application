import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_color.dart';

class ContainerForCarFeatures extends StatelessWidget {
  const ContainerForCarFeatures({
    super.key,
    required this.text,
    required this.text2,
  });
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,
      height: 44.h,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: AppColor.primary50,
          border: Border.all(color: AppColor.primary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}
