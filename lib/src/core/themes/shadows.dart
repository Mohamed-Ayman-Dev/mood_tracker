import 'package:flutter/cupertino.dart';

abstract class AppShadows {
  static BoxShadow buttonShadow(Color color) {
    return BoxShadow(
      color: color.withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 2,
      offset: const Offset(0, 4),
    );
  }
}
