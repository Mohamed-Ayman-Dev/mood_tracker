import 'package:flutter/material.dart';

extension Spacing on num {
  // Vertical spacing
  Widget get heightSpace => SizedBox(height: toDouble());

  // Horizontal spacing
  Widget get widthSpace => SizedBox(width: toDouble());
}
