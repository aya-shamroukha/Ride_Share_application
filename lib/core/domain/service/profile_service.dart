import 'package:dio/dio.dart';
import 'package:ride_application/core/domain/model/auth/change_password.dart';
import 'package:ride_application/core/domain/model/error_model.dart';

abstract class ProfileService {
  changePassword(ChangePasswordModel change);
  late String baseUrl = 'https://rideshare.devscape.online/api/v1/';
  policy();
}

class ProfileServiceImpl extends ProfileService {
  @override
  changePassword(change) async {
    Dio dio = Dio();
    try {
      Response response = await dio.put('${baseUrl}users/change-password',
          data: change.toJson(),
          options: Options(headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            "User-Agent": "PostmanRuntime/7.41.1",
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzI0ODQyOTMzLCJleHAiOjE3MjQ5MjkzMzN9.Wc6HhBH-NKQzx0QUKQkEw_vNCh_JqL1mfCH7yrOAFcA'
          }));
      if (response.statusCode == 202) {
        return response.data;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return ErrorModel(message: 'The Status Code is not 200');
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message.toString());
      return ExceptionModel(message: e.message.toString());
    }
  }

  @override
  policy() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('${baseUrl}policy',
          options: Options(headers: {
            'accept': '*/*',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzI0ODQyOTMzLCJleHAiOjE3MjQ5MjkzMzN9.Wc6HhBH-NKQzx0QUKQkEw_vNCh_JqL1mfCH7yrOAFcA'
          }));
      if (response.statusCode == 200) {
        print(response);
        return response.data;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return ErrorModel(message: 'The Status Code is not 200');
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message.toString());
      return ExceptionModel(message: e.message.toString());
    }
  }
}
