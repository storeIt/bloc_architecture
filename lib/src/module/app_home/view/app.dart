import 'package:bloc_architecture/src/config/router/app_router.dart';
import 'package:bloc_architecture/src/module/app_home/view/app_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
