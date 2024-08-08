import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.buttonText, required this.onPressed, required this.isDark});

  final String buttonText;
  final VoidCallback onPressed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JSizes.md),
      child: SizedBox(
        width: JHelper.screenWidth(context) * 0.7,
        height: 52,
        child: ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? JColors.blue : JColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(JSizes.borderRadiusLg)
          ),
        ), child: Text(buttonText, style: const TextStyle(fontSize: JSizes.md, fontWeight: FontWeight.w600, color: JColors.white),),),
      ),
    );
  }
}
