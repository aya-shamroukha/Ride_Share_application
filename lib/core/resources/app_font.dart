import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_application/core/resources/app_color.dart';

TextStyle textStyle(
    {required Color color,
    required double fontsize,
    required FontWeight fontWeight}) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontsize.sp, fontWeight: fontWeight);
}

//bold style
TextStyle boldStyle({
  Color? color,
  double? fontsize,
}) {
  return textStyle(
    color: color ?? AppColor.titlecolor,
    fontsize: fontsize ?? 24,
    fontWeight: FontWeight.w600,
  );
}

//regular style

TextStyle smallStyle({
  Color? color,
  double? fontsize,
}) {
  return textStyle(
    color: color ?? AppColor.grey,
    fontsize: fontsize ?? 15,
    fontWeight: FontWeight.w400,
  );
}

//normal Style
TextStyle normalStyle({
  Color? color,
  double? fontsize,
}) {
  return textStyle(
    color: color ?? AppColor.grey2,
    fontsize: fontsize ?? 16,
    fontWeight: FontWeight.w500,
  );
}
