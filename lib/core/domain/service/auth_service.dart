// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/domain/model/auth/login_model.dart';
import 'package:ride_application/core/domain/model/auth/signup_model.dart';
import 'package:ride_application/core/domain/model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService {
  signUp(SignUpModel signup);
  logIn(LogInModel login);
  late String baseUrl = 'https://rideshare.devscape.online/api/v1/';
}

class AuthServiceImpl extends AuthService {
  @override
  logIn(login) async {
    Dio dio = Dio();
    try {
      Response response =
          await dio.post('${baseUrl}auth/authenticate', data: login.toJson());
      if (response.statusCode == 200) {
        print(response);
        print(response.data['body']['token']);
        getIt
            .get<SharedPreferences>()
            .setString('token', response.data['body']['token']);
        return response.data;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return ErrorModel(message: 'The Status Code is not 200');
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return ExceptionModel(message: e.message.toString());
    }
  }

  @override
  signUp(signup) async {
    Dio dio = Dio();
    try {
      Response response =
          await dio.post('${baseUrl}auth/register', data: signup.toJson());
      if (response.statusCode == 200) {
        print(response);
        print(response.data['body']['token']);
        getIt
            .get<SharedPreferences>()
            .setString('token', response.data['body']['token']);
        return response.data;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return ErrorModel(message: 'The Status Code is not 200');
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return ExceptionModel(message: e.message.toString());
    }
  }
}
