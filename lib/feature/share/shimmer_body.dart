import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerBody extends StatelessWidget {
  const ShimmerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color: AppColor.white,
        height: 170.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
