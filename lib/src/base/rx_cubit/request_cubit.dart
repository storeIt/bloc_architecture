import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';
import 'request_state.dart';

abstract class RequestCubit<R>
    extends Cubit<RequestState> {
  final R api;
  final bool autoLoad;

  RequestCubit(this.api, {this.autoLoad = true})
      : super(const RequestState.init()) {
    if (autoLoad == true) _loadDataLoading();
  }

  void _loadDataLoading() {
    emit(const RequestState.loading());
    loadData();
  }

  Future<void> loadData();
}
