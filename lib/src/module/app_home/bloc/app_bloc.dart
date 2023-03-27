import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/src/util/ui/dialog/dialog_presenter.dart';
import 'package:bloc_architecture/src/util/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  LoadingOverlay loadingOverlay;

  AppBloc(BuildContext context) : loadingOverlay = LoadingOverlay(context),
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
