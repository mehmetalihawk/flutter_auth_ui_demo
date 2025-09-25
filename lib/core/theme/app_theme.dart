import 'package:flutter/material.dart';
import 'tokens.dart';
import 'typography.dart';

final appTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'Muli',

  scaffoldBackgroundColor: Tokens.backgroundColor,
  colorScheme: const ColorScheme.light(
    primary: Tokens.primaryColor,
    primaryContainer: Tokens.primaryLightColor,
    surface: Tokens.backgroundColor,
    background: Tokens.backgroundColor,
    onPrimary: Colors.white,
    onSurface: Tokens.textColor,
  ),

  primaryColor: Tokens.primaryColor,
  primaryColorLight: Tokens.primaryLightColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: Tokens.backgroundColor,
    foregroundColor: Tokens.textColor,
    elevation: 0,
    centerTitle: true,

    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
  ),

  textTheme: const TextTheme(
    headlineLarge: AppTypography.h1,
    headlineMedium: AppTypography.h2,
    bodyMedium: AppTypography.body,
    bodySmall: AppTypography.caption,
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: Tokens.pill,
      borderSide: BorderSide(color: Tokens.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: Tokens.pill,
      borderSide: BorderSide(color: Tokens.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: Tokens.pill,
      borderSide: BorderSide(color: Tokens.primaryColor, width: 1.5),
    ),
    labelStyle: TextStyle(fontSize: Tokens.s12, fontWeight: FontWeight.w600, color: Tokens.hintColor),
    floatingLabelStyle: TextStyle(fontSize: Tokens.s16, fontWeight: FontWeight.w600, color: Tokens.hintColor),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: EdgeInsets.fromLTRB(Tokens.s20, Tokens.s20, Tokens.s20, Tokens.s16),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Tokens.primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, Tokens.s52),
      shape: RoundedRectangleBorder(borderRadius: Tokens.pill),
    ),
  ),
);
