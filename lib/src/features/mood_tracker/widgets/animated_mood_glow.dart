import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';
import '../../../core/themes/gradients.dart';

class AnimatedMoodGlow extends StatelessWidget {
  final Color color;

  const AnimatedMoodGlow({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: Constant.animationDuration,
        curve: Constant.glowAnimationCurve,
        decoration: BoxDecoration(gradient: AppGradients.glowGradient(color)),
      ),
    );
  }
}
