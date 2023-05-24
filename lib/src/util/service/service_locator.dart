import 'package:get_it/get_it.dart';

import '../helper/base_data_provider.dart';
import '../helper/logger_helper.dart';
import 'retrofit_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register services
  locator.registerLazySingleton<RetrofitService>(() => RetrofitService());
  locator.registerFactory<LoggerHelper>(() => LoggerHelper());
  locator.registerFactory<BaseDataProvider>(() => BaseDataProvider());
}
