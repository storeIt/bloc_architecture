import 'package:bloc_architecture/src/util/service/retrofit_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<RetrofitService>(() => RetrofitService());
}