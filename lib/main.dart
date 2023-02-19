import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/module/home/view/app.dart';
import 'src/products_bloc_observer.dart';
import 'src/util/service/service_locator.dart';

void main() {
  Bloc.observer = ProductsBlocObserver();
  setupLocator();
  runApp(const App());
}

