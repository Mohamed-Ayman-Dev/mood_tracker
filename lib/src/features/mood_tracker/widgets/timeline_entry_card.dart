import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';

import '../models/mood_entry.dart';
import '../painters/mood_face_painter.dart';

class TimelineEntryCard extends StatefulWidget {
  final MoodEntry entry;

  const TimelineEntryCard({super.key, required this.entry});

  @override
  State<TimelineEntryCard> createState() => _TimelineEntryCardState();
}

class _TimelineEntryCardState extends State<TimelineEntryCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late final Animation<double> _scale = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.20), weight: 35),
    TweenSequenceItem(tween: Tween(begin: 1.20, end: 0.92), weight: 35),
    TweenSequenceItem(tween: Tween(begin: 0.92, end: 1.0), weight: 30),
  ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

  // Glow fades in then out alongside the scale bounce
  late final Animation<double> _glow = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mood = widget.entry.mood;
    final c = mood.color;

    return GestureDetector(
      onTap: () => _ctrl.forward(from: 0.0),
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) => Transform.scale(
          scale: _scale.value,
          child: Container(
            width: 100,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: c.withOpacity(0.3 + _glow.value * 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: c.withOpacity(0.08 + _glow.value * 0.22),
                  blurRadius: 10 + _glow.value * 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: child,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Mood colour accent bar at top
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: c,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  SizedBox(
                    width: 58,
                    height: 58,
                    child: CustomPaint(painter: MoodFacePainter(mood: mood)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    mood.label,
                    style: TextStyle(
                      color: c,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    _fmtDate(widget.entry.timestamp),
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 9.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _fmtTime(widget.entry.timestamp),
                    style: TextStyle(
                      color: c.withOpacity(0.8),
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _fmtDate(DateTime dt) {
    const m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    const d = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${d[dt.weekday - 1]}, ${m[dt.month - 1]} ${dt.day}';
  }

  String _fmtTime(DateTime dt) {
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final min = dt.minute.toString().padLeft(2, '0');
    return '$h:$min ${dt.hour >= 12 ? "PM" : "AM"}';
  }
}
