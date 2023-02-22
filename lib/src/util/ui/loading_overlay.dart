import 'package:bloc_architecture/src/base/app_cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/app_cubit/base_state.dart';
import '../../base/app_cubit/request_state.dart';

class LoadingOverlay {
  late final OverlayEntry? _overlay;

  LoadingOverlay();

  void showLoading(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => const ColoredBox(
          color: Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hideLoading() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}

class StatelessSample extends StatelessWidget {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  StatelessSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BaseCubit<RequestState>, BaseState>(
        listener: (context, state) {
          if (state is RequestState) {
            _loadingOverlay.showLoading(context);
          } else {
            _loadingOverlay.hideLoading();
          }
        },
        child: Container(),
      ),
    );
  }
}