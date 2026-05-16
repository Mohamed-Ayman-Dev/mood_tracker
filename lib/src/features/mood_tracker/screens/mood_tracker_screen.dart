import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/core/extension/space_extensions_helper.dart';
import 'package:mood_tracker/src/core/themes/app_radius.dart';
import 'package:mood_tracker/src/core/themes/colors.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums.dart';
import '../providers/mood_tracker.dart';
import '../widgets/animated_mood_glow.dart';
import '../widgets/mood_selector_card.dart';
import '../widgets/painters/mood_face_painter.dart';
import '../widgets/timeline_entry_card.dart';

class MoodTrackerScreen extends StatelessWidget {
  static const routeName = '/mood_tracker_screen';

  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedMoodGlow(color: AppColors.primaryColor),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        50.heightSpace,
                        _Header(),
                        50.heightSpace,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.borderRadiusLarge24,
                            color: Color(0XFF33215a),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1.5,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 70,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: CustomPaint(
                                  painter: MoodFacePainter(
                                    mood: MoodType.happy,
                                  ),
                                ),
                              ),
                              30.heightSpace,
                              Text('Happy', style: AppTextStyles.labelMedium),
                            ],
                          ),
                        ),
                        50.heightSpace,

                        _MoodSelector(),
                        48.heightSpace,
                        _Timeline(),
                        48.heightSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Prompt ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'SATURDAY, MAY 16',
        textAlign: TextAlign.center,

        style: TextStyle(
          fontSize: 12,
          color: AppColors.thirdColor,

          fontWeight: FontWeight.w300,
        ),
      ),
      10.heightSpace,
      Center(
        child: Text(
          'How are you\nfeeling today?',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge,
        ),
      ),
      8.heightSpace,
    ],
  );
}

// ─── Mood Selector ────────────────────────────────────────────────────────────

class _MoodSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: AppRadius.borderRadiusLarge24,
      ),
      child: Wrap(
        children: MoodType.values
            .map(
              (mood) => MoodSelectorCard(
                mood: mood,
                onTap: () {
                  context.read<MoodProvider>().addMood(mood);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${mood.label} logged ✓'),
                      duration: const Duration(seconds: 1),
                      backgroundColor: mood.color,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(16),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

// ─── Timeline ─────────────────────────────────────────────────────────────────

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Consumer only wraps this widget — no full-screen rebuild
    return Consumer<MoodProvider>(
      builder: (context, provider, _) {
        final entries = provider.last7Entries;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Recent Entries',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(width: 8),
                if (entries.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${entries.length}/7',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            entries.isEmpty
                ? _EmptyTimeline()
                : SizedBox(
                    height: 155,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: entries.length,
                      itemBuilder: (_, i) =>
                          TimelineEntryCard(entry: entries[i]),
                    ),
                  ),
          ],
        );
      },
    );
  }
}

class _EmptyTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFEEEEEE), width: 1.5),
    ),
    child: const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🎯', style: TextStyle(fontSize: 28)),
          SizedBox(height: 8),
          Text(
            'Log your first mood above!',
            style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 13),
          ),
        ],
      ),
    ),
  );
}
