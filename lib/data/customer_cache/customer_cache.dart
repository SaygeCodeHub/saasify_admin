import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';

class CustomerCache {
  final SharedPreferences sharedPreferences;
  final String customerCartKey = 'customerCartKey';

  CustomerCache({required this.sharedPreferences});

  void setIsLoggedIn(bool boolValue) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, boolValue);
  }

  void setCompanyId(String string) async {
    await sharedPreferences.setString(CacheKeys.companyId, string);
  }

  Future<bool?> getIsLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn);
  }

  Future<String> getCompanyId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
