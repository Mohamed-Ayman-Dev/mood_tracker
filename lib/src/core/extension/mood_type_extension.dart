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
    MoodType.ecstatic => AppColors.moodEcstaticColor,
    MoodType.happy => AppColors.moodHappyColor,
    MoodType.neutral => AppColors.moodNeutralColor,
    MoodType.sad => AppColors.moodSadColor,
    MoodType.awful => AppColors.moodAwfulColor,
  };

  Color get bgColor => switch (this) {
    MoodType.ecstatic => CupertinoColors.transparent,
    MoodType.happy => CupertinoColors.transparent,
    MoodType.neutral => CupertinoColors.transparent,
    MoodType.sad => CupertinoColors.transparent,
    MoodType.awful => CupertinoColors.transparent,
  };
}
