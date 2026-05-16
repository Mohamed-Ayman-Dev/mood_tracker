import 'package:flutter/material.dart';
import 'package:mood_tracker/src/core/constants/enums.dart';
import 'package:mood_tracker/src/core/extension/mood_type_extension.dart';
import 'package:mood_tracker/src/core/responsive/responsive_layout.dart';
import 'package:mood_tracker/src/core/themes/shadows.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';
import 'package:mood_tracker/src/features/mood_tracker/providers/mood_tracker.dart';
import 'package:provider/provider.dart';

import '../constants/app_feedback.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile =
            constraints.maxWidth < ResponsiveLayout.mobileBreakpoint;
        bool isTablet =
            constraints.maxWidth < ResponsiveLayout.tabletBreakpoint;

        return Selector<MoodProvider, MoodType>(
          selector: (context, provider) => provider.selectedMood,
          builder: (context, selectedMood, child) {
            return GestureDetector(
              onTapDown: (_) => _ctrl.forward(),
              onTapUp: (_) => _ctrl.reverse(),
              onTapCancel: () => _ctrl.reverse(),
              onTap: () {
                context.read<MoodProvider>().addMood();
                AppFeedback.successPopUp(
                  context,
                  title: '${selectedMood.label} logged successfully!',
                  mode: selectedMood,
                );
              },
              child: AnimatedBuilder(
                animation: _ctrl,
                builder: (_, __) => Transform.scale(
                  scale: _scale.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    width: isMobile
                        ? 450
                        : isTablet
                        ? 600
                        : 750,
                    height: 60,
                    decoration: BoxDecoration(
                      color: selectedMood.color,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [AppShadows.buttonShadow(selectedMood.color)],
                    ),
                    child: Center(
                      child: Text(
                        'Log this mood',
                        style: AppTextStyles.labelLarge,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
