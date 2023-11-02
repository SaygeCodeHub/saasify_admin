import 'package:flutter/material.dart';

class ProgressBar {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()));
        });
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
