import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/mood_tracker/providers/mood_tracker.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<MoodProvider>(create: (_) => MoodProvider()),
  ];
}
