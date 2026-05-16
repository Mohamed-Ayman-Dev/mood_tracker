import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < mobileBreakpoint) {
          return mobileLayout;
        } else if (width < tabletBreakpoint) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
