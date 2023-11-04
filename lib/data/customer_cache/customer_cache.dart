import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';

class CustomerCache {
  final SharedPreferences sharedPreferences;
  final String customerCartKey = 'customerCartKey';

  CustomerCache({required this.sharedPreferences});

  void setIsLoggedIn(bool boolValue) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, boolValue);
  }

  void setUserId(String string) async {
    await sharedPreferences.setString(CacheKeys.userId, string);
  }

  Future<bool?> getIsLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn);
  }

  Future<String> getUserrId() async {
    return sharedPreferences.getString(CacheKeys.userId) ?? '';
  }

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
