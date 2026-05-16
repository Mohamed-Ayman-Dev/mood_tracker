import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppGradients {
  static const buttonGradient = LinearGradient(
    colors: [AppColors.secondaryColor, AppColors.primaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static RadialGradient glowGradient(Color color) {
    return RadialGradient(
      center: const Alignment(0, -0.2),
      radius: 0.6,
      colors: [
        color.withOpacity(.2),
        color.withOpacity(.1),
        Colors.transparent,
      ],
      stops: const [0, .35, 1],
    );
  }
}
