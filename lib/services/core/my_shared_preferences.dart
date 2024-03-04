import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  Future<bool> saveData(String key, String value, {int expireIn = 0}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (expireIn > 0) {
        final DateTime now = DateTime.now();
        final DateTime expire = now.add(Duration(seconds: expireIn));
        await prefs.setString(key, value);
        await prefs.setString('${key}_expire', expire.toIso8601String());
      } else {
        await prefs.setString(key, value);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<String?> getDataIfNotExpired(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    final String? expire = prefs.getString('${key}_expire');
    if (value != null && expire != null) {
      final DateTime now = DateTime.now();
      final DateTime expireDate = DateTime.parse(expire);
      if (now.isBefore(expireDate)) {
        return value;
      } else {
        await removeData(key);
      }
    }
    return null;
  }

  Future<bool> removeData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key);
      await prefs.remove(key + '_expire');
      return true;
    } catch (e) {
      return false;
    }
  }
}
