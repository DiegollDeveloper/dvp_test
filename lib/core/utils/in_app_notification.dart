import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class InAppNotification {
  static void show({
    BuildContext? context,
    int duration = 3,
    String? title,
    required String message,
    required NotificationType type,
  }) {
    if (context != null) {
      Flushbar(
        title: title,
        message: message,
        duration: Duration(seconds: duration),
        icon: type == NotificationType.success
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : type == NotificationType.warning
                ? const Icon(
                    Icons.error,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.cancel_sharp,
                    color: Colors.white,
                  ),
        backgroundColor: type == NotificationType.success
            ? Colors.green
            : type == NotificationType.warning
                ? Colors.orange
                : Colors.red,
      ).show(context);
    }
  }
}

enum NotificationType {
  success,
  warning,
  error,
}
