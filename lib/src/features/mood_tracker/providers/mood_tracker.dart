import 'package:flutter/foundation.dart';

import '../../../core/constants/enums.dart';
import '../models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  MoodType selectedMood = MoodType.happy;

  final List<MoodEntry> _entries = [];

  List<MoodEntry> get last7Entries {
    final sorted = List<MoodEntry>.from(_entries)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return sorted.take(7).toList();
  }

  bool get hasEntries => _entries.isNotEmpty;

  void addMood() {
    _entries.add(
      MoodEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        mood: selectedMood,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void setSelectedMood(MoodType mood) {
    if (selectedMood == mood) return;
    selectedMood = mood;
    notifyListeners();
  }
}
