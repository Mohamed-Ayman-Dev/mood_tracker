import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mood_tracker/src/core/themes/text_styles.dart';

import '../constants/constant.dart';
import 'colors.dart';

export 'colors.dart';
export 'gradients.dart';

abstract class CustomTheme {
  // Contains the information about the light theme

  static InputDecoration outlinedBorderInputDecoration = InputDecoration(
    // contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    hintStyle: AppTextStyles.labelSmall,
    filled: true,
    focusColor: AppColors.primaryColor,
    fillColor: Colors.white,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
      borderSide: BorderSide(color: AppColors.errorTextColor),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Constant.fontFamily,
    highlightColor: AppColors.primaryColor.withOpacity(0.2),
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.backgroundColor,
      elevation: 0,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      backgroundColor: AppColors.navBarBackgroundColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(color: AppColors.backgroundColor),
    ),
    scrollbarTheme: ScrollbarThemeData(
      trackColor: WidgetStateProperty.all(AppColors.primaryColor),
      thumbColor: WidgetStateProperty.all(
        AppColors.primaryColor.withOpacity(0.7),
      ),
      trackBorderColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    splashColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarBackGroundColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.tileTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
      ),
    ),
    listTileTheme: const ListTileThemeData(textColor: AppColors.tileTextColor),
    textTheme: TextTheme(
      bodySmall: AppTextStyles.bodySmall,
      bodyMedium: AppTextStyles.bodyMedium,
      titleMedium: AppTextStyles.titleMedium,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
      titleSmall: AppTextStyles.titleSmall,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF8B8B8B),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(AppColors.iconButtonIconColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyles.labelSmall,
      errorStyle: const TextStyle(
        fontSize: 13,
        color: AppColors.errorTextColor,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorTextColor),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorTextColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: AppColors.buttonTextColor,
          fontSize: 14.sp,
          fontFamily: Constant.fontFamily,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        maximumSize: Size(double.infinity, 48.h),
        minimumSize: Size(double.infinity, 48.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: Constant.fontFamily,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
        elevation: 0,
        maximumSize: Size(double.infinity, 48.h),
        minimumSize: Size(double.infinity, 48.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        side: BorderSide(color: AppColors.primaryColor),
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.dividerColor),
    radioTheme: RadioThemeData(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashRadius: 15,
      fillColor: WidgetStateProperty.all(AppColors.borderColor),
    ),
    checkboxTheme: CheckboxThemeData(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashRadius: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
  );
}
