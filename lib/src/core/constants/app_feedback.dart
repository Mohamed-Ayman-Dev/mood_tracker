import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/helpers/dialog_helpers.dart';

final class AppFeedback {
  AppFeedback._();

  static void successPopUp(
    BuildContext context, {
    required String title,
    required MoodType mode,
  }) {
    DialogHelpers.showSuccessDialog(context, title: title, mode: mode);
  }

  // static void successToast(String message) {
  //   EasyLoading.showToast(
  //     message,
  //     toastPosition: EasyLoadingToastPosition.bottom,
  //     dismissOnTap: true,
  //     duration: const Duration(seconds: 3),
  //   );
  // }

  // static void loadingMessage({String? message}) {
  //   EasyLoading.show(status: message ?? S.current.pleaseWait);
  // }
  //
  // static void errorMessage(dynamic message) {
  //   final errorMessage = message?.toString() ?? S.current.somethingWentWrong;
  //   EasyLoading.showError(
  //     errorMessage,
  //     dismissOnTap: true,
  //     duration: const Duration(seconds: 3),
  //   );
  // }
}
