import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/theme/custom_themes/appbar_theme.dart';
import 'package:journo/utils/theme/custom_themes/chip_theme.dart';
import 'package:journo/utils/theme/custom_themes/text_theme.dart';

class JTheme {
  JTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: JColors.orange,
      scaffoldBackgroundColor: JColors.white,
      textTheme: JTextTheme.lightTextTheme,
      chipTheme: JChipTheme.lightChipTheme,
      // elevatedButtonTheme: EZElevatedButtonTheme.lightElevatedThemeButton,
      // outlinedButtonTheme: EZOutlinedButtonTheme.lightOutlinedButtonTheme,
      appBarTheme: JAppBarTheme.lightAppBarTheme,
      // bottomSheetTheme: EZBottomSheetTheme.lightBottomSheetTheme,
      // checkboxTheme: EZCheckBoxTheme.lightCheckBoxTheme,
      // inputDecorationTheme: EZTextFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      primaryColor: JColors.orange,
      scaffoldBackgroundColor: JColors.black,
      textTheme: JTextTheme.darkTextTheme,
      chipTheme: JChipTheme.darkChipTheme,
      // elevatedButtonTheme: EZElevatedButtonTheme.darkElevatedThemeButton,
      // outlinedButtonTheme: EZOutlinedButtonTheme.darkOutlinedButtonTheme,
      appBarTheme: JAppBarTheme.darkAppBarTheme,
      // bottomSheetTheme: EZBottomSheetTheme.darkBottomSheetTheme,
      // checkboxTheme: EZCheckBoxTheme.darkCheckBoxTheme,
      // inputDecorationTheme: EZTextFieldTheme.darkInputDecorationTheme
  );
}