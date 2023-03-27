import 'package:flutter/material.dart';

import '../../../widget/dialog/confirm_dialog.dart';

class DialogPresenter {

  void showConfirmDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmDialog(message)
    );
  }
}