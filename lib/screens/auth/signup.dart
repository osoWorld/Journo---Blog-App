import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/auth/login.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var isObscurePass = true;
  var isObscureConfirmPass = true;
  final _formKey = GlobalKey<FormState>();
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final height = JHelper.screenHeight(context);
    final width = JHelper.screenWidth(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: isDark ? JColors.blue : JColors.orange,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: JSizes.appBarHeight * 1.5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(image: AssetImage(JImages.splashIconDark)),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeInOut,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    JSizes.borderRadiusXLg * 2.5),
                                topRight: Radius.circular(
                                    JSizes.borderRadiusXLg * 2.5),
                              ),
                              color: JColors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: JSizes.appBarHeight,
                                horizontal: JSizes.spaceBtwSections),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  JText.signUp,
                                  style: TextStyle(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: JSizes.spaceBtwSections,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        style: const TextStyle(
                                            color: JColors.black),
                                        decoration: InputDecoration(
                                            label: Text(
                                              JText.email,
                                              style: TextStyle(
                                                  color: isDark
                                                      ? JColors.blue
                                                      : JColors.orange,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                            prefixIcon: Icon(
                                              Iconsax.direct,
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      JSizes.borderRadiusXLg),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 2))),
                                      ),
                                      const SizedBox(
                                        height: JSizes.spaceBtwSections,
                                      ),
                                      TextFormField(
                                        obscureText: isObscurePass,
                                        style: const TextStyle(
                                            color: JColors.black),
                                        decoration: InputDecoration(
                                            label: Text(
                                              JText.password,
                                              style: TextStyle(
                                                  color: isDark
                                                      ? JColors.blue
                                                      : JColors.orange,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                            prefixIcon: Icon(
                                              Iconsax.lock,
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange,
                                            ),
                                            suffixIcon: IconButton(
                                                onPressed: () => setState(() {
                                                  isObscurePass = !isObscurePass;
                                                    }),
                                                icon: Icon(
                                                  isObscurePass
                                                      ? Iconsax.eye_slash
                                                      : Iconsax.eye,
                                                  color: isDark
                                                      ? JColors.blue
                                                      : JColors.orange,
                                                )),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      JSizes.borderRadiusXLg),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 2))),
                                      ),
                                      const SizedBox(
                                        height: JSizes.spaceBtwSections,
                                      ),
                                      TextFormField(
                                        obscureText: isObscureConfirmPass,
                                        style: const TextStyle(
                                            color: JColors.black),
                                        decoration: InputDecoration(
                                            label: Text(
                                              JText.confirmPassword,
                                              style: TextStyle(
                                                  color: isDark
                                                      ? JColors.blue
                                                      : JColors.orange,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                            prefixIcon: Icon(
                                              Iconsax.lock,
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange,
                                            ),
                                            suffixIcon: IconButton(
                                                onPressed: () => setState(() {
                                                  isObscureConfirmPass = !isObscureConfirmPass;
                                                    }),
                                                icon: Icon(
                                                  isObscureConfirmPass
                                                      ? Iconsax.eye_slash
                                                      : Iconsax.eye,
                                                  color: isDark
                                                      ? JColors.blue
                                                      : JColors.orange,
                                                )),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      JSizes.borderRadiusXLg),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        JSizes.borderRadiusXLg),
                                                borderSide: BorderSide(
                                                    color: isDark
                                                        ? JColors.blue
                                                        : JColors.orange,
                                                    width: 2))),
                                      ),
                                      const SizedBox(
                                        height: JSizes.spaceBtwItems,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (value) => setState(() {
                                              isChecked = !isChecked;
                                            }),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            checkColor: Colors.white,
                                            activeColor: isDark
                                                ? JColors.blue
                                                : JColors.orange,
                                            side: BorderSide(
                                                color: isDark
                                                    ? JColors.blue
                                                    : JColors.orange,
                                                width: 2),
                                          ),
                                          Text(
                                            JText.rememberMe,
                                            style: TextStyle(
                                                color: isDark
                                                    ? JColors.blue
                                                    : JColors.orange,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: JSizes.spaceBtwSections,
                                ),
                                MainButton(
                                    buttonText: JText.signUp,
                                    onPressed: () {},
                                    isDark: isDark),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      JText.alreadyHaveAccount,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: isDark
                                              ? JColors.blue
                                              : JColors.orange),
                                    ),
                                    TextButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            )),
                                        child: Text(
                                          JText.login,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
