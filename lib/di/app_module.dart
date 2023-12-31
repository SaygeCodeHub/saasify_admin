

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/customer_cache/customer_cache.dart';
import '../services/client_services.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<ClientServices>(() => ClientServices());

  getIt.registerLazySingletonAsync<SharedPreferences>(
          () async => await SharedPreferences.getInstance());
  getIt.registerLazySingleton<CustomerCache>(
          () => CustomerCache(sharedPreferences: getIt<SharedPreferences>()));

}
