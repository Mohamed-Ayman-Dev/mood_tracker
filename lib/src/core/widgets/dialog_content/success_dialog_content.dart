import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/core/themes/app_radius.dart';

import '../../../features/mood_tracker/widgets/painters/mood_face_painter.dart';
import '../../extension/space_extensions_helper.dart';
import '../../themes/colors.dart';
import '../../themes/text_styles.dart';

class SuccessDialogContent extends StatefulWidget {
  final String title;
  final MoodType mode;

  const SuccessDialogContent({
    super.key,
    required this.title,
    required this.mode,
  });

  @override
  State<SuccessDialogContent> createState() => _SuccessDialogContentState();
}

class _SuccessDialogContentState extends State<SuccessDialogContent> {
  @override
  void initState() {
    super.initState();
    _autoClose();
  }

  Future<void> _autoClose() async {
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    final route = ModalRoute.of(context);
    // Only close if this dialog is still the top route
    if (route?.isCurrent ?? false) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.borderRadiusLarge24,

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

        child: Container(
          constraints: BoxConstraints(minWidth: 270),
          decoration: BoxDecoration(
            border: Border.all(color: widget.mode.color),
            borderRadius: AppRadius.borderRadiusLarge24,
            color: AppColors.backgroundColor.withOpacity(0.65),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CustomPaint(
                    painter: MoodFacePainter(mood: widget.mode),
                  ),
                ),
                24.heightSpace,

                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 20,
                    color: widget.mode.color,
                  ),
                ),
                10.heightSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
