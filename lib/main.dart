import 'dart:async';

import 'package:bloc_architecture/src/constant/app_constants.dart';
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
  await setupLocator();
  FlutterError.onError = (FlutterErrorDetails details) {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = ProductsBlocObserver();

    if (kDebugMode) locator<LoggerHelper>().e(AppConstant.unknownException, details.exception, details.stack);
  };

  runZonedGuarded(() {
    runApp(const App());
  }, (error, stack) {
    // TODO : add to Firebase Crashlytics
    if (kDebugMode) {
      locator<LoggerHelper>().e('$error', error, stack);
    }
  });
}
