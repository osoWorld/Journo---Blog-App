import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';

class JChipTheme {
  JChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: JColors.orange,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: JColors.white
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: JColors.orange,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: JColors.white
  );

}