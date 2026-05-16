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
      radius: 0.9,
      colors: [
        color.withOpacity(.28),
        color.withOpacity(.12),
        Colors.transparent,
      ],
      stops: const [0, .35, 1],
    );
  }
}
