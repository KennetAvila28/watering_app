import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  Future<SharedPreferences> get _sharedPreferences =>
      SharedPreferences.getInstance();

  Future<bool> saveBool(bool data, String key) async =>
      _sharedPreferences.then((preferences) => preferences.setBool(key, data));
  Future<bool> saveString(String data, String key) async => _sharedPreferences
      .then((preferences) => preferences.setString(key, data));
  Future<bool?> getBool(String key) async =>
      _sharedPreferences.then((preferences) => preferences.getBool(key));
  Future<String?> getString(String key) async =>
      _sharedPreferences.then((preferences) => preferences.getString(key));
  Future<bool> removeKey(String key) async =>
      _sharedPreferences.then((preferences) => preferences.remove(key));
}

class SharedPreferencesKeys {
  SharedPreferencesKeys._();

  static const user = "user";
  // static const isGest = "guest";
  // static const isGest = "guest";
}
