// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 54,
    this.width = 340,
    required this.onPressed,
    this.background,
    required this.text,
    this.textcolor,
    this.shape,
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  final Color? textcolor;
  final dynamic shape;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
            side: WidgetStateProperty.all(BorderSide(color: AppColor.primary)),
            backgroundColor:
                WidgetStateProperty.all(background ?? Colors.white)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: textcolor ?? Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
