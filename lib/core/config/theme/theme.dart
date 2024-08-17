import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_application/core/resources/app_color.dart';
import 'package:ride_application/core/resources/app_font.dart';

ThemeData appTheme = ThemeData(
    //brightness: Brightness.dark,
    primaryColor: AppColor.primary,

//  appBarTheme:  AppBarTheme(
//   backgroundColor: AppColor.background,
//   centerTitle: false,

//  iconTheme: IconThemeData(color: AppColor.white),
//   titleTextStyle:
//   TextStyle(fontSize: 24,color: AppColor.textColor,fontWeight: FontWeight.normal),
// elevation: 0,

//   ),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   shape: CircleBorder(),
    //   backgroundColor: AppColor.primary),
    scaffoldBackgroundColor: AppColor.white,
    //drawerTheme: DrawerThemeData(backgroundColor: AppColor.background),
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: normalStyle(),
      displaySmall: smallStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          side: const BorderSide(),
          backgroundColor: AppColor.primary,
          textStyle: TextStyle(color: AppColor.white, fontSize: 16.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      labelStyle: TextStyle(fontSize: 16.sp, color: AppColor.grey),
      fillColor: AppColor.secondary,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.grey)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.grey)),
      hintStyle: TextStyle(fontSize: 15.sp, color: AppColor.grey),
    ));
