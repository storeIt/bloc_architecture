import 'dart:async';

import 'package:bloc_architecture/src/util/helper/logger_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/module/app_home/view/app.dart';
import 'src/products_bloc_observer.dart';
import 'src/util/service/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = ProductsBlocObserver();
// TODO : why runZonedGuarded is in another thread?

  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) locator<LoggerHelper>().e('main(), FlutterError.onError', details.exception, details.stack);
  };

  runZonedGuarded(() async {
    runApp(const App());
  }, (error, stack) {
    // TODO : add to Firebase Crashlytics
    if (kDebugMode) {
      locator<LoggerHelper>().e('main() runZonedGuarded() $error', error, stack);
    } else {
      locator<LoggerHelper>().e('main() runZonedGuarded() else{} $error', error, stack);
    }
  });
}
