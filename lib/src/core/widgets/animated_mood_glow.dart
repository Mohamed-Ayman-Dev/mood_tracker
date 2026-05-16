import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/features/mood_tracker/providers/mood_tracker.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';
import '../themes/gradients.dart';

class AnimatedBKGlow extends StatelessWidget {
  const AnimatedBKGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Selector<MoodProvider, MoodType>(
        selector: (context, provider) => provider.selectedMood,
        builder: (context, selectedMood, child) {
          return AnimatedContainer(
            duration: Constant.animationDuration,
            curve: Constant.glowAnimationCurve,
            decoration: BoxDecoration(
              gradient: AppGradients.glowGradient(selectedMood.color),
            ),
          );
        },
      ),
    );
  }
}
