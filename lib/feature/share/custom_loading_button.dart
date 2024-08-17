import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ride_application/core/resources/app_color.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Duration(milliseconds: 500);
    return SpinKitChasingDots(
      color: AppColor.primary,
    );
  }
}
