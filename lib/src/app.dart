import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_tracker/src/core/routes.dart';
import 'package:provider/provider.dart';

import 'core/app_providers.dart';
import 'core/themes/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(375, 812),
      // fontSizeResolver: (fontSize, instance) {
      //   final scale = instance.scaleWidth.clamp(0.85, 1.15);
      //   return fontSize * scale;
      // },
      child: MultiProvider(
        providers: AppProviders.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mood Tracker',
          color: Colors.white,
          themeMode: ThemeMode.system,
          theme: CustomTheme.lightTheme,
          initialRoute: Routes.initialRoute,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
