import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static SharedPreferences? sharedPreference;

  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, dynamic value}) async {
    if (value is int) {
      await sharedPreference?.setInt(key, value);
    } else if (value is String) {
      await sharedPreference?.setString(key, value).then((value) => print('After Set String $value'));
    } else if (value is bool) {
      await sharedPreference?.setBool(key, value);
    } else if (value is double) {
      await sharedPreference?.setDouble(key, value);
    } else {
    }
  }

  static get({required String key}) {
    return sharedPreference?.get(key);
  }

  static removeKey(String key){
    sharedPreference?.remove(key);
  }

  static clear(){
    sharedPreference?.clear();
  }
}