import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_application/core/config/check_internet.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

initgetit() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

class SharedPreferencesUtil {
  final SharedPreferences sharedPreferences;

  SharedPreferencesUtil({required this.sharedPreferences});

  static String namekey = 'aya';
  String? getName({required String string}) {
    return sharedPreferences.getString(string);
  }

  Future<bool> setName(String name) async {
    return sharedPreferences.setString(namekey, name);
  }

  int? getInt({required String intt}) {
    return sharedPreferences.getInt(intt);
  }
}
