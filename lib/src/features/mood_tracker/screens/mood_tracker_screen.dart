import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/extension/space_extensions_helper.dart';
import 'package:mood_tracker/src/core/themes/colors.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';
import 'package:mood_tracker/src/core/widgets/custom_animated_button.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/mood_perview.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/mood_selector.dart';

import '../../../core/widgets/animated_mood_glow.dart';
import '../widgets/timeline.dart';

class MoodTrackerScreen extends StatelessWidget {
  static const routeName = '/mood_tracker_screen';

  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBKGlow(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        50.heightSpace,
                        Text(
                          'SATURDAY, MAY 16',
                          textAlign: TextAlign.center,

                          style: AppTextStyles.headlineSmall,
                        ),
                        10.heightSpace,
                        Text(
                          'How are you\nfeeling today?',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headlineLarge,
                        ),
                        50.heightSpace,
                        MoodPreview(),
                        40.heightSpace,
                        MoodSelector(),
                        48.heightSpace,
                        CustomAnimatedButton(),
                        40.heightSpace,
                        Timeline(),
                        48.heightSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
