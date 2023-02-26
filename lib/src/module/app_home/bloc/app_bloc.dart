import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/src/util/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitialState()) {
    on<AppLoadingEvent>((event, emit) {
      emit(AppLoadingState());
    });
    on<AppLoadedEvent>((event, emit) {
      emit(AppLoadedState());
    });
  }
}
