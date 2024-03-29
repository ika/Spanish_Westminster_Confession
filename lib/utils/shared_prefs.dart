import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> sharedPrefs = SharedPreferences.getInstance();

  // ==================SET=====================

  Future<void> setStringPref(String key, String value) async {
    final prefs = await sharedPrefs;
    prefs.setString(key, value);
  }

  // Future<void> setIntPref(String key, int value) async {
  //   final prefs = await sharedPrefs;
  //   prefs.setInt(key, value);
  // }

  Future<bool> setDoublePref(String key, double value) async {
    final prefs = await sharedPrefs;
    return await (prefs.setDouble(key, value)) ? true : false;
  }

  // Future<bool> setBoolPref(String key, bool value) async {
  //   final prefs = await sharedPrefs;
  //   return await (prefs.setBool(key, value)) ? true : false;
  // }

  // ==================GET=====================

  Future<String?> getStringPref(String key) async {
    final prefs = await sharedPrefs;
    return prefs.getString(key);
  }

  // Future<int?> getIntPref(String key) async {
  //   final prefs = await sharedPrefs;
  //   return prefs.getInt(key);
  // }

  Future<double?> getDoublePref(String key) async {
    final prefs = await sharedPrefs;
    return prefs.getDouble(key);
  }

  // Future<bool?> getBoolPref(String key) async {
  //   final prefs = await sharedPrefs;
  //   return prefs.getBool(key);
  // }
}
