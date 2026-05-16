import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums.dart';
import '../providers/mood_tracker.dart';
import '../widgets/mood_selector_card.dart';
import '../widgets/timeline_entry_card.dart';

class MoodTrackerScreen extends StatelessWidget {
  static const routeName = '/mood_tracker_screen';

  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),
                    _Prompt(),
                    const SizedBox(height: 32),
                    _MoodSelector(),
                    const SizedBox(height: 48),
                    _Timeline(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  static const _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  static const _months = [
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

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateStr =
        '${_weekdays[now.weekday - 1]}, ${_months[now.month - 1]} ${now.day}';
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      color: Colors.white,
      child: Row(
        children: [
          const Text('🌿', style: TextStyle(fontSize: 26)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mood Tracker',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              Text(
                dateStr,
                style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Prompt ───────────────────────────────────────────────────────────────────

class _Prompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'How are you\nfeeling today?',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1A1A2E),
          height: 1.2,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Tap a mood to log how you feel right now.',
        style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
      ),
    ],
  );
}

// ─── Mood Selector ────────────────────────────────────────────────────────────

class _MoodSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<MoodProvider>(); // write-only → no rebuild
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: MoodType.values
          .map(
            (mood) => MoodSelectorCard(
              mood: mood,
              onTap: () {
                provider.addMood(mood);
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
