import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/features/mood_tracker/providers/mood_tracker.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/floating_mood_face.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums.dart';
import '../../../core/extension/space_extensions_helper.dart';
import '../../../core/themes/app_radius.dart';
import '../../../core/themes/colors.dart';
import '../../../core/themes/text_styles.dart';

class MoodPreview extends StatefulWidget {
  const MoodPreview({super.key});

  @override
  State<MoodPreview> createState() => _MoodPreviewState();
}

class _MoodPreviewState extends State<MoodPreview> {
  @override
  Widget build(BuildContext context) {
    return Selector<MoodProvider, MoodType>(
      selector: (context, provider) => provider.selectedMood,
      builder: (context, selectedMood, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: AppRadius.borderRadiusLarge24,
            color: AppColors.moodPreviewBackGroundColor,
            border: Border.all(color: AppColors.borderColor, width: 1.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 140, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingMoodFace(mood: selectedMood),
              30.heightSpace,
              Text(
                selectedMood.label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: selectedMood.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
