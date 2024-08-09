import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/auth/login.dart';
import 'package:journo/screens/auth/signup.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final width = JHelper.screenWidth(context);
    return Scaffold(
      body: Stack(
        children: [
          const Image(image: AssetImage(JImages.choiceBgImg)),
          Padding(
            padding: const EdgeInsets.all(JSizes.spaceBtwSections),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image(
                        image: AssetImage(isDark
                            ? JImages.splashIconDark
                            : JImages.splashIconLight)),
                    Text(role == "Creator" ?
                      JText.forCreators : "",
                      style: TextStyle(
                          color: isDark ? JColors.white : JColors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                        role == "Creator"
                            ? JText.choiceScreenTextCreator
                            : JText.choiceScreenTextUser,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: JColors.white)),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        width: width * 0.8,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(role: role,),
                                )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isDark ? JColors.blue : JColors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      JSizes.borderRadiusLg)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  JText.login,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: JColors.white),
                                ),
                                Icon(
                                  Iconsax.arrow_right_1,
                                  color: JColors.white,
                                )
                              ],
                            ))),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      height: 50,
                      width: width * 0.8,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(role: role,),
                            )),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusLg)),
                          side:
                              const BorderSide(color: JColors.white, width: 2),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              JText.register,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: JColors.white),
                            ),
                            Icon(
                              Iconsax.wifi5,
                              color: JColors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
