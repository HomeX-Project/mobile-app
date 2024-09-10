import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
