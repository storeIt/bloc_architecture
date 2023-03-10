import 'package:flutter/material.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;
  final BuildContext context;

  LoadingOverlay(this.context);

  void showLoading() {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (_) => const ColoredBox(
          color: Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
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