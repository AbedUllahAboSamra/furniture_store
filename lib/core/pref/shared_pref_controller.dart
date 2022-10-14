 import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { showBoardScreen , id, name, email, mobile, verified, token }

class SharedPrefController {
  SharedPrefController._();
  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;
  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveBool(String key , bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  void clear() async {
    _sharedPreferences.clear();
  }
}
