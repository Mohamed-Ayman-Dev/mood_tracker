import '../../../core/constants/enums.dart';

class MoodEntry {
  final String id;

  final MoodType mood;
  final DateTime timestamp;

  const MoodEntry({
    required this.id,
    required this.mood,
    required this.timestamp,
  });
}
