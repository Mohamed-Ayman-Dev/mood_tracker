import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';

/// Draws a mood face using only canvas primitives.
///
/// Arc angles in Flutter (y-axis points DOWN):
///   0       = 3 o'clock (right)
///   pi/2    = 6 o'clock (bottom)
///   pi      = 9 o'clock (left)
///   3*pi/2  = 12 o'clock (top)
///
/// Smile  → drawArc(rect, pi, pi)  : left → TOP → right  (upward curve)
/// Frown  → drawArc(rect, 0,  pi)  : right → BOTTOM → left (downward curve)
class MoodFacePainter extends CustomPainter {
  final MoodType mood;

  const MoodFacePainter({required this.mood});

  // ─── Paint factories ──────────────────────────────────────────────────────

  Paint _stroke(Color c, {double w = 2.0}) => Paint()
    ..color = c
    ..style = PaintingStyle.stroke
    ..strokeWidth = w
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  Paint _fill(Color c) => Paint()
    ..color = c
    ..style = PaintingStyle.fill;

  // ─── Main paint ───────────────────────────────────────────────────────────

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(cx, cy) * 0.88;
    final center = Offset(cx, cy);
    final c = mood.color;

    // Face background
    canvas.drawCircle(center, r, _fill(mood.bgColor));
    // Face border
    canvas.drawCircle(center, r, _stroke(c, w: 8));

    switch (mood) {
      case MoodType.ecstatic:
        _drawEcstatic(canvas, cx, cy, r, c);
      case MoodType.happy:
        _drawHappy(canvas, cx, cy, r, c);
      case MoodType.neutral:
        _drawNeutral(canvas, cx, cy, r, c);
      case MoodType.sad:
        _drawSad(canvas, cx, cy, r, c);
      case MoodType.awful:
        _drawAwful(canvas, cx, cy, r, c);
    }
  }

  // ─── ECSTATIC ─────────────────────────────────────────────────────────────
  // Signature: sparkle eyes, strongly raised arched brows, wide open smile, rosy cheeks
  void _drawEcstatic(Canvas canvas, double cx, double cy, double r, Color c) {
    final eyeY = cy - r * 0.22;
    final lx = cx - r * 0.32;
    final rx = cx + r * 0.32;
    final eyeR = r * 0.12;

    // Sparkle eyes: filled circle + 4 radiating rays
    for (final ex in [lx, rx]) {
      canvas.drawCircle(Offset(ex, eyeY), eyeR, _fill(c));
      // Highlight
      canvas.drawCircle(
        Offset(ex + eyeR * 0.35, eyeY - eyeR * 0.35),
        eyeR * 0.28,
        _fill(Colors.white.withOpacity(0.85)),
      );
      // Rays at 45° intervals
      for (int i = 0; i < 4; i++) {
        final angle = i * math.pi / 2 + math.pi / 4;
        canvas.drawLine(
          Offset(
            ex + math.cos(angle) * eyeR * 1.35,
            eyeY + math.sin(angle) * eyeR * 1.35,
          ),
          Offset(
            ex + math.cos(angle) * eyeR * 2.0,
            eyeY + math.sin(angle) * eyeR * 2.0,
          ),
          _stroke(c, w: 1.8),
        );
      }
    }

    // Strongly raised arched eyebrows
    _arcEyebrow(canvas, lx, eyeY - r * 0.3, r * 0.22, 0.4, c);
    _arcEyebrow(canvas, rx, eyeY - r * 0.3, r * 0.22, 0.4, c);

    // Wide open smile (arc = top half of ellipse = upward curve)
    final smileW = r * 1.22;
    final smileH = r * 0.62;
    final smileCY = cy + r * 0.42;
    final smileRect = Rect.fromCenter(
      center: Offset(cx, smileCY),
      width: smileW,
      height: smileH,
    );
    // Open mouth fill
    final mouthPath = Path()..addArc(smileRect, math.pi, math.pi);
    mouthPath.close();
    canvas.drawPath(mouthPath, _fill(c.withOpacity(0.15)));
    canvas.drawArc(smileRect, math.pi, math.pi, false, _stroke(c, w: 3.0));
    // Teeth divider line
    canvas.drawLine(
      Offset(cx - smileW / 2 + 2, smileCY),
      Offset(cx + smileW / 2 - 2, smileCY),
      _stroke(c.withOpacity(0.45), w: 1.2),
    );

    // Rosy cheeks
    canvas.drawCircle(
      Offset(lx - r * 0.08, cy + r * 0.1),
      r * 0.14,
      _fill(c.withOpacity(0.18)),
    );
    canvas.drawCircle(
      Offset(rx + r * 0.08, cy + r * 0.1),
      r * 0.14,
      _fill(c.withOpacity(0.18)),
    );
  }

  // ─── HAPPY ────────────────────────────────────────────────────────────────
  // Signature: round eyes with highlight, gently arched brows, clean medium smile
  void _drawHappy(Canvas canvas, double cx, double cy, double r, Color c) {
    final eyeY = cy - r * 0.22;
    final lx = cx - r * 0.30;
    final rx = cx + r * 0.30;
    final eyeR = r * 0.10;

    for (final ex in [lx, rx]) {
      canvas.drawCircle(Offset(ex, eyeY), eyeR, _fill(c));
      canvas.drawCircle(
        Offset(ex + eyeR * 0.35, eyeY - eyeR * 0.35),
        eyeR * 0.3,
        _fill(Colors.white.withOpacity(0.8)),
      );
    }

    // Gently arched brows
    _arcEyebrow(canvas, lx, eyeY - r * 0.22, r * 0.19, 0.18, c);
    _arcEyebrow(canvas, rx, eyeY - r * 0.22, r * 0.19, 0.18, c);

    // Medium smile
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(cx, cy + r * 0.38),
        width: r * 0.95,
        height: r * 0.46,
      ),
      math.pi,
      -math.pi,
      false,
      _stroke(c, w: 3),
    );
  }

  // ─── NEUTRAL ──────────────────────────────────────────────────────────────
  // Signature: oval eyes, flat horizontal brows, flat horizontal mouth
  void _drawNeutral(Canvas canvas, double cx, double cy, double r, Color c) {
    final eyeY = cy - r * 0.22;
    final lx = cx - r * 0.28;
    final rx = cx + r * 0.28;

    // Oval eyes (wider than tall)
    for (final ex in [lx, rx]) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(ex, eyeY),
          width: r * 0.20,
          height: r * 0.13,
        ),
        _fill(c),
      );
    }

    // Flat straight brows — distinct from other moods
    for (final ex in [lx, rx]) {
      canvas.drawLine(
        Offset(ex - r * 0.13, eyeY - r * 0.21),
        Offset(ex + r * 0.13, eyeY - r * 0.21),
        _stroke(c, w: 2.2),
      );
    }

    // Flat straight mouth — clearly not a smile or frown
    canvas.drawLine(
      Offset(cx - r * 0.30, cy + r * 0.32),
      Offset(cx + r * 0.30, cy + r * 0.32),
      _stroke(c, w: 3),
    );
  }

  // ─── SAD ──────────────────────────────────────────────────────────────────
  // Signature: inner brows raised (\‾/), frown arc, teardrop
  void _drawSad(Canvas canvas, double cx, double cy, double r, Color c) {
    final eyeY = cy - r * 0.22;
    final lx = cx - r * 0.30;
    final rx = cx + r * 0.30;
    final eyeR = r * 0.09;

    for (final ex in [lx, rx]) {
      canvas.drawCircle(Offset(ex, eyeY), eyeR, _fill(c));
    }

    // Sad brows: inner corner higher than outer (worried look)
    _sadEyebrow(canvas, lx, eyeY - r * 0.21, r * 0.19, c, isLeft: true);
    _sadEyebrow(canvas, rx, eyeY - r * 0.21, r * 0.19, c, isLeft: false);

    // Frown: right → BOTTOM → left (downward curve)
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(cx, cy + r * 0.28),
        width: r * 0.80,
        height: r * 0.36,
      ),
      0,
      math.pi,
      false,
      _stroke(c, w: 3),
    );

    // Teardrop under left eye
    _drawTear(
      canvas,
      Offset(lx + r * 0.04, eyeY + eyeR + r * 0.04),
      r * 0.09,
      c,
    );
  }

  // ─── AWFUL ────────────────────────────────────────────────────────────────
  // Signature: X eyes, strongly angry brows (/‾\), deep wide frown, sweat drop
  void _drawAwful(Canvas canvas, double cx, double cy, double r, Color c) {
    final eyeY = cy - r * 0.22;
    final lx = cx - r * 0.30;
    final rx = cx + r * 0.30;
    final xs = r * 0.12; // X arm half-length

    // X eyes
    for (final ex in [lx, rx]) {
      canvas.drawLine(
        Offset(ex - xs, eyeY - xs),
        Offset(ex + xs, eyeY + xs),
        _stroke(c, w: 3),
      );
      canvas.drawLine(
        Offset(ex + xs, eyeY - xs),
        Offset(ex - xs, eyeY + xs),
        _stroke(c, w: 3),
      );
    }

    // Angry brows: outer end raised, inner end lower — scowl (/‾\)
    _angryEyebrow(canvas, lx, eyeY - r * 0.23, r * 0.21, c, isLeft: true);
    _angryEyebrow(canvas, rx, eyeY - r * 0.23, r * 0.21, c, isLeft: false);

    // Deep wide frown
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(cx, cy + r * 0.25),
        width: r * 1.02,
        height: r * 0.50,
      ),
      0,
      math.pi,
      false,
      _stroke(c, w: 3.0),
    );

    // Sweat drop on upper-right of face
    _drawTear(
      canvas,
      Offset(cx + r * 0.45, cy - r * 0.55),
      r * 0.075,
      c.withOpacity(0.6),
    );
  }

  // ─── Eyebrow helpers ──────────────────────────────────────────────────────

  /// Neutral/happy arch: mid-point of brow is higher than ends.
  void _arcEyebrow(
    Canvas canvas,
    double ex,
    double ey,
    double w,
    double lift,
    Color c,
  ) {
    final half = w / 2;
    final path = Path()
      ..moveTo(ex - half, ey)
      ..quadraticBezierTo(ex, ey - w * lift, ex + half, ey);
    canvas.drawPath(path, _stroke(c, w: 2.2));
  }

  /// Sad brow: inner corner raised, outer corner lower.
  void _sadEyebrow(
    Canvas canvas,
    double ex,
    double ey,
    double w,
    Color c, {
    required bool isLeft,
  }) {
    final half = w / 2;
    final path = Path();
    if (isLeft) {
      // Left: outer(left)=lower, inner(right)=higher
      path.moveTo(ex - half, ey + w * 0.22);
      path.lineTo(ex + half, ey - w * 0.22);
    } else {
      // Right: inner(left)=higher, outer(right)=lower
      path.moveTo(ex - half, ey - w * 0.22);
      path.lineTo(ex + half, ey + w * 0.22);
    }
    canvas.drawPath(path, _stroke(c, w: 2.0));
  }

  /// Angry brow: outer end raised, inner end lower — creates scowl.
  void _angryEyebrow(
    Canvas canvas,
    double ex,
    double ey,
    double w,
    Color c, {
    required bool isLeft,
  }) {
    final half = w / 2;
    final path = Path();
    if (isLeft) {
      // Left: outer(left)=higher, inner(right)=lower
      path.moveTo(ex - half, ey - w * 0.28);
      path.lineTo(ex + half, ey + w * 0.10);
    } else {
      // Right: inner(left)=lower, outer(right)=higher
      path.moveTo(ex - half, ey + w * 0.10);
      path.lineTo(ex + half, ey - w * 0.28);
    }
    canvas.drawPath(path, _stroke(c, w: 3));
  }

  /// Teardrop shape drawn with cubic beziers.
  void _drawTear(Canvas canvas, Offset top, double r, Color c) {
    final path = Path()
      ..moveTo(top.dx, top.dy)
      ..cubicTo(
        top.dx + r * 1.4,
        top.dy + r,
        top.dx + r * 1.4,
        top.dy + r * 2,
        top.dx,
        top.dy + r * 2.5,
      )
      ..cubicTo(
        top.dx - r * 1.4,
        top.dy + r * 2,
        top.dx - r * 1.4,
        top.dy + r,
        top.dx,
        top.dy,
      );
    canvas.drawPath(path, _fill(c.withOpacity(0.7)));
  }

  @override
  bool shouldRepaint(MoodFacePainter old) => old.mood != mood;
}
