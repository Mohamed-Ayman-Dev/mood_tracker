import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';

import '../themes/colors.dart';

extension MoodTypeX on MoodType {
  String get label => switch (this) {
    MoodType.ecstatic => 'Ecstatic',
    MoodType.happy => 'Happy',
    MoodType.neutral => 'Neutral',
    MoodType.sad => 'Sad',
    MoodType.awful => 'Awful',
  };

  Color get color => switch (this) {
    MoodType.ecstatic => const Color(0xFFFFB300),
    MoodType.happy => AppColors.moodHappyColor,
    MoodType.neutral => const Color(0xFF1E88E5),
    MoodType.sad => const Color(0xFF8E24AA),
    MoodType.awful => const Color(0xFFE53935),
  };

  Color get bgColor => switch (this) {
    MoodType.ecstatic => CupertinoColors.transparent,
    MoodType.happy => CupertinoColors.transparent,
    MoodType.neutral => CupertinoColors.transparent,
    MoodType.sad => CupertinoColors.transparent,
    MoodType.awful => CupertinoColors.transparent,
  };
}
