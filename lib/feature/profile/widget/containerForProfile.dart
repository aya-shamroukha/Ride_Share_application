import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_color.dart';

class ContainerForProfile extends StatelessWidget {
  const ContainerForProfile({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 362.w,
          height: 51.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.primary)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.textcolor),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColor.textcolor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
