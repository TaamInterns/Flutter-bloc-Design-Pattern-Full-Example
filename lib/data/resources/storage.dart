import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> clearItem(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future setItemLocalStorage(key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String> getItemLocalStorage(key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(key))
      return preferences.getString(key);
    else
      return null;
  }

  static Future setApiToken(token) async {
    await setItemLocalStorage('api_token', token);
  }

  static Future<String> getApiToken() async {
    return await getItemLocalStorage('api_token');
  }
}
