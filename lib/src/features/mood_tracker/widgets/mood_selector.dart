import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums.dart';
import '../../../core/themes/app_radius.dart';
import '../../../core/themes/colors.dart';
import '../providers/mood_tracker.dart';
import 'cards/mood_selector_card.dart';

class MoodSelector extends StatelessWidget {
  const MoodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: AppRadius.borderRadiusLarge24,
      ),
      child: Wrap(
        children: MoodType.values
            .map(
              (mood) => MoodSelectorCard(
                mood: mood,
                onTap: () {
                  context.read<MoodProvider>().setSelectedMood(mood);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
