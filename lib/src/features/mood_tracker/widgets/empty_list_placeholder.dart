import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/themes/colors.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';

import '../../../core/extension/space_extensions_helper.dart';

class EmptyTimeline extends StatelessWidget {
  const EmptyTimeline({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          8.heightSpace,
          Text(
            'Log your first mood above!',
            style: AppTextStyles.labelMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.thirdColor,
            ),
          ),
        ],
      ),
    ),
  );
}
