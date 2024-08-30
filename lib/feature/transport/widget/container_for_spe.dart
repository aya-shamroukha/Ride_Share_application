import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/feature/share/sized_box.dart';

class ContainerForSpecifi extends StatelessWidget {
  const ContainerForSpecifi({
    super.key,
    required this.icon,
    required this.text,
    required this.text2,
  });
  final IconData icon;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      height: 81.2.h,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: AppColor.primary50,
          border: Border.all(color: AppColor.primary),
          borderRadius: BorderRadius.circular(8)),
      child: Expanded(
        child: Column(
          children: [
            SizedBox_Height(height: 3.h),
            Icon(
              icon,
              color: AppColor.grey2,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColor.textcolor, fontSize: 15),
            ),
            Text(
              text2,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColor.grey2,
                  fontSize: 12,
                  overflow: TextOverflow.fade),
            )
          ],
        ),
      ),
    );
  }
}
