import 'package:flutter/material.dart';
import 'package:mood_tracker/src/config/routes.dart';
import 'package:mood_tracker/src/core/constants/constant.dart';
import 'package:provider/provider.dart';

import '../core/app_providers.dart';
import '../core/themes/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.fontFamily,
        color: Colors.white,
        themeMode: ThemeMode.system,
        theme: CustomTheme.lightTheme,
        initialRoute: Routes.initialRoute,
        routes: Routes.routes,
      ),
    );
  }
}
