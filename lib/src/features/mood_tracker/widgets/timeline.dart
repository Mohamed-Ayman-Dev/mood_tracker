import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/themes/colors.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';
import 'package:mood_tracker/src/features/mood_tracker/models/mood_entry.dart';
import 'package:mood_tracker/src/features/mood_tracker/providers/mood_tracker.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/cards/timeline_entry_card.dart';
import 'package:mood_tracker/src/features/mood_tracker/widgets/empty_list_placeholder.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/space_extensions_helper.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MoodProvider, List<MoodEntry>>(
      selector: (context, provider) => provider.last7Entries,
      builder: (context, entries, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Recent Entries',
                  style: AppTextStyles.labelLarge.copyWith(fontSize: 16),
                ),
                8.heightSpace,
                if (entries.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.moodNumberBackGroundColor,
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
            16.heightSpace,
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
