import 'package:core/enum/font_type.dart';
import 'package:flutter/material.dart';
import 'package:core/theme/colors_assets.dart';

class ThemeResource {
  static var fontType = getFontFamilyType(FontFamilyType.prozaLibre);

  ThemeMode? themeMode;


  //DarkTheme
  //TODO: change your dark theme according to your Ui
  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    brightness: Brightness.dark,
    primaryColor: DarkThemeColors.primaryColor,
    secondaryHeaderColor: DarkThemeColors.secondaryColor,
    dividerColor: DarkThemeColors.dividerColor,
    fontFamily: fontType,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: DarkThemeColors.primaryColor,
      onSecondary: DarkThemeColors.secondaryColor.withOpacity(0.80),
      onError: DarkThemeColors.errorColor.withOpacity(0.80),
      onPrimary: DarkThemeColors.primaryColor.withOpacity(0.80),
      surface: DarkThemeColors.backgroundColor,
      secondary: DarkThemeColors.secondaryColor,
      error: DarkThemeColors.errorColor,
      onSurface: DarkThemeColors.backgroundColor.withOpacity(0.80),
      primaryContainer: DarkThemeColors.textPrimary,
      secondaryContainer: DarkThemeColors.textSecondary,
      onTertiaryContainer: DarkThemeColors.primaryColor,
      outline: DarkThemeColors.dividerColor,
    ),
    // border color
    buttonTheme: ButtonThemeData(
      buttonColor: DarkThemeColors.primaryColor,
      disabledColor: DarkThemeColors.textDisabled,
      focusColor: DarkThemeColors.secondaryColor,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.bold, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500, //MEDIUM
        color: DarkThemeColors.textPrimary,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600, //SEMI BOLD
        color: DarkThemeColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
    ),
  );

  //Light Theme
  //TODO: change your light theme according to your Ui
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColors.backgroundColor,
    brightness: Brightness.light,
    primaryColor: LightThemeColors.primaryColor,
    secondaryHeaderColor: LightThemeColors.secondaryColor,
    dividerColor: LightThemeColors.dividerColor,
    fontFamily: fontType,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColors.primaryColor,
      onSecondary: LightThemeColors.secondaryColor.withOpacity(0.80),
      onError: LightThemeColors.errorColor.withOpacity(0.80),
      onPrimary: LightThemeColors.primaryColor.withOpacity(0.80),
      surface: LightThemeColors.backgroundColor,
      secondary: LightThemeColors.secondaryColor,
      error: LightThemeColors.errorColor,
      onSurface: LightThemeColors.backgroundColor.withOpacity(0.80),
      primaryContainer: LightThemeColors.textPrimary,
      secondaryContainer: LightThemeColors.textSecondary,
      onTertiaryContainer: LightThemeColors.textDisabled,
      outline: LightThemeColors.dividerColor,
    ),
    // border color
    buttonTheme: ButtonThemeData(
        buttonColor: LightThemeColors.primaryColor,
        disabledColor: LightThemeColors.textDisabled,
        focusColor: LightThemeColors.secondaryColor),
    textTheme: TextTheme(
        labelLarge: TextStyle(
            fontWeight: FontWeight.bold, //BOLD
            color: LightThemeColors.textPrimary),
        labelMedium: TextStyle(
            fontWeight: FontWeight.w500, //MEDIUM
            color: LightThemeColors.textPrimary),
        labelSmall: TextStyle(
            fontWeight: FontWeight.normal, //NORMAL
            color: LightThemeColors.textPrimary),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w600, //SEMI BOLD
            color: LightThemeColors.textPrimary),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w500, //BOLD
            color: LightThemeColors.textPrimary),
        titleSmall: TextStyle(
            fontWeight: FontWeight.normal, //NORMAL
            color: LightThemeColors.textPrimary)),
  );

}
