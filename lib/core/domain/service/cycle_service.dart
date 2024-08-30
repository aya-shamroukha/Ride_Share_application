// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ride_application/core/domain/model/error_model.dart';

abstract class CycleService {
  getAllbicyles();
  late String baseUrl = 'https://rideshare.devscape.online/api/v1/';
  getBicycleById(int id);
}

class CycleImpl extends CycleService {
  @override
  getAllbicyles() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('${baseUrl}bicycle',
          options: Options(headers: {
            'accept': '*/*',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzI0MjM4MzE3LCJleHAiOjE3MjQzMjQ3MTd9.5-8VEugdgreTVdopD21m8h7uRjqX08Pe55IXrYqwZbw'
          }));
      if (response.statusCode == 200) {
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
  getBicycleById(id) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get('${baseUrl}bicycle/$id',
          options: Options(headers: {
            'accept': '*/*',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzI0MjM4MzE3LCJleHAiOjE3MjQzMjQ3MTd9.5-8VEugdgreTVdopD21m8h7uRjqX08Pe55IXrYqwZbw'
          }));
      if (response.statusCode == 200) {
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
