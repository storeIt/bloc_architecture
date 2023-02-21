import 'package:flutter_bloc/flutter_bloc.dart';

import 'util/helper/logger_helper.dart';
import 'util/service/service_locator.dart';

class ProductsBlocObserver extends BlocObserver {
  final _logger = locator<LoggerHelper>();

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.i('ProductsBlocObserver onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.e('ProductsBlocObserver onError', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.i('ProductsBlocObserver onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.i('ProductsBlocObserver onChange $change');
    super.onChange(bloc, change);
  }
}
