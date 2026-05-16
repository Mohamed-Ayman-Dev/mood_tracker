import 'package:flutter/foundation.dart';

import '../../../core/constants/enums.dart';
import '../models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  final List<MoodEntry> _entries = [];

  /// Returns up to the 7 most recent entries, newest first.
  List<MoodEntry> get last7Entries {
    final sorted = List<MoodEntry>.from(_entries)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted.take(7).toList();
  }

  bool get hasEntries => _entries.isNotEmpty;

  void addMood(MoodType mood) {
    _entries.add(
      MoodEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        mood: mood,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
