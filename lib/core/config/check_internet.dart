import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/app_color.dart';

import '../../feature/share/toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

var res;
initialData() async {
  res = await checkInternet();
  print(res);
  if (res == false) {
    while (!res) {
      showTost(message: 'NO INTERNET', state: ToastState.error);
      await Future.delayed(const Duration(
          seconds: 1)); // wait for 1 second before checking again
      res = await checkInternet();
    }
  } else {
    return null;
  }
}
