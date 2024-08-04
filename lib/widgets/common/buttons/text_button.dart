import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/sizes.dart';

class JTextButton extends StatelessWidget {
  const JTextButton({
    super.key,
    required this.buttonText,
    required this.isDark,
    required this.onPressed,
  });

  final bool isDark;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: isDark ? JColors.blue : JColors.orange,
              fontWeight: FontWeight.w600,
              fontSize: JSizes.md),
        ));
  }
}