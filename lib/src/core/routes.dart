import 'package:flutter/material.dart';

import '../features/mood_tracker/screens/mood_tracker_screen.dart';

class Routes {
  static const initialRoute = MoodTrackerScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MoodTrackerScreen.routeName: (_) => const MoodTrackerScreen(),
  };
}
