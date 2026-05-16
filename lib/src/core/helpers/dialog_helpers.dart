import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/widgets/dialog_content/success_dialog_content.dart';

final class DialogHelpers {
  DialogHelpers._();

  static Future<void>? showSuccessDialog(
    BuildContext context, {
    required String title,
    required MoodType mode,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return AlertDialog(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          content: SuccessDialogContent(title: title, mode: mode),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,

          child: ScaleTransition(
            scale: Tween<double>(begin: 0.92, end: 1.0).animate(
              CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
