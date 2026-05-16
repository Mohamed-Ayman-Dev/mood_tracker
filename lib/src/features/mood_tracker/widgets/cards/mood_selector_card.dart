import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/core/extension/space_extensions_helper.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/painters/mood_face_painter.dart';

class MoodSelectorCard extends StatefulWidget {
  final MoodType mood;
  final VoidCallback onTap;

  const MoodSelectorCard({super.key, required this.mood, required this.onTap});

  @override
  State<MoodSelectorCard> createState() => _MoodSelectorCardState();
}

class _MoodSelectorCardState extends State<MoodSelectorCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  );

  late final Animation<double> _scale = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.22), weight: 40),
    TweenSequenceItem(tween: Tween(begin: 1.22, end: 0.94), weight: 30),
    TweenSequenceItem(tween: Tween(begin: 0.94, end: 1.0), weight: 30),
  ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

  bool _hovered = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onTap() {
    _ctrl.forward(from: 0.0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.mood.color;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedBuilder(
          animation: _scale,
          builder: (_, child) =>
              Transform.scale(scale: _scale.value, child: child),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 150,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 6),
            decoration: BoxDecoration(
              color: _hovered ? widget.mood.bgColor : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _hovered ? c : Colors.transparent,
                width: _hovered ? 2.0 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: _hovered
                      ? c.withOpacity(0.22)
                      : Colors.black.withOpacity(0.05),
                  blurRadius: _hovered ? 14 : 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CustomPaint(
                    painter: MoodFacePainter(mood: widget.mood),
                  ),
                ),
                6.heightSpace,
                Text(
                  widget.mood.label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: c,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
