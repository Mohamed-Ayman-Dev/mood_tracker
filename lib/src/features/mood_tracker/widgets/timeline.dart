import 'package:flutter/material.dart';
import 'package:mood_tracker/src/features/mood_tracker/providers/mood_tracker.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/cards/timeline_entry_card.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/empty_list_placeholder.dart';
import 'package:provider/provider.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

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
                    color: Colors.white,
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
                ? EmptyTimeline()
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
