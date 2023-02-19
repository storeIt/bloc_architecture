import 'package:bloc_architecture/src/util/helper/base_data_provider.dart';
import 'package:bloc_architecture/src/util/service/retrofit_service.dart';
import 'package:get_it/get_it.dart';

import '../helper/logger_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<RetrofitService>(() => RetrofitService());
  locator.registerFactory<LoggerHelper>(() => LoggerHelper());
  locator.registerFactory<BaseDataProvider>(() => BaseDataProvider());
}
