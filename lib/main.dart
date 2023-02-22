import 'dart:async';

import 'package:bloc_architecture/src/util/helper/logger_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/module/app_home/view/app.dart';
import 'src/products_bloc_observer.dart';
import 'src/util/service/service_locator.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = ProductsBlocObserver();
// TODO : why runZonedGuarded is in another thread?
  runZonedGuarded(() async {
    runApp(const App());
  }, (error, stack) {
    // TODO : add to Firebase Crashlytics
    locator<LoggerHelper>().e('Uncaught exception', error, stack);
  });
}
