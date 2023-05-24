import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/ui/dialog/dialog_presenter.dart';
import '../../../util/ui/loading_indicator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  LoadingOverlay loadingOverlay;

  AppBloc(BuildContext context)
      : loadingOverlay = LoadingOverlay(context),
        super(AppInitialState()) {
    on<AppLoadingEvent>((event, emit) {
      loadingOverlay.showLoading();
    });
    on<AppLoadedEvent>((event, emit) {
      loadingOverlay.hideLoading();
    });
    on<AppFailureEvent>((event, emit) {
      DialogPresenter().showConfirmDialog(context, event.message);
    });
  }
}
