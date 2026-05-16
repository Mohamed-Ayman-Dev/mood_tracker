import 'package:flutter/material.dart';

final class AppRadius {
  AppRadius._();

  static const small8 = Radius.circular(8);
  static const medium12 = Radius.circular(12);
  static const large24 = Radius.circular(24);

  static const borderRadiusSmall8 = BorderRadius.all(small8);

  static const borderRadiusMedium12 = BorderRadius.all(medium12);

  static const borderRadiusLarge24 = BorderRadius.all(large24);
}
