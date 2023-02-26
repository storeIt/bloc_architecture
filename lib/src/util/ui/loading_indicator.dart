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

// class LoadingIndicator extends StatelessWidget {
//   final LoadingOverlay _loadingOverlay = LoadingOverlay();
//
//   LoadingIndicator({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AppBloc, AppState>(
//         listener: (context, state) {
//           if (state is AppLoadingState) {
//             _loadingOverlay.showLoading(context);
//           } else {
//             _loadingOverlay.hideLoading();
//           }
//         },
//       ),
//     );
//   }
// }