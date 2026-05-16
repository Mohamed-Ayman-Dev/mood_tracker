import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/painters/mood_face_painter.dart';

import '../../../core/constants/enums.dart';

class FloatingMoodFace extends StatefulWidget {
  final MoodType mood;

  const FloatingMoodFace({super.key, required this.mood});

  @override
  State<FloatingMoodFace> createState() => _FloatingMoodFaceState();
}

class _FloatingMoodFaceState extends State<FloatingMoodFace>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offsetY = lerpDouble(-8, 8, _controller.value)!;

        return Transform.translate(offset: Offset(0, offsetY), child: child);
      },

      child: SizedBox(
        width: 150,
        height: 150,
        child: CustomPaint(painter: MoodFacePainter(mood: widget.mood)),
      ),
    );
  }
}
