import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/auth/signup.dart';
import 'package:journo/screens/category/category.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isObscure = true;
  final _formKey = GlobalKey<FormState>();
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);

    return Scaffold(
        backgroundColor: isDark ? JColors.blue : JColors.orange,
        appBar: AppBar(automaticallyImplyLeading: false,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(image: AssetImage(JImages.splashIconDark)),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 3),
                    curve: Curves.easeInOut,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(JSizes.borderRadiusXLg * 2.5),
                          topRight:
                              Radius.circular(JSizes.borderRadiusXLg * 2.5),
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
                            JText.login,
                            style: TextStyle(
                                color: isDark ? JColors.blue : JColors.orange,
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
                                  style:
                                      const TextStyle(color: JColors.black),
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
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //       JSizes.borderRadiusXLg),
                                      // ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              JSizes.borderRadiusXLg),
                                          borderSide: BorderSide(
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
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
                                  obscureText: isObscure,
                                  style:
                                      const TextStyle(color: JColors.black),
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
                                        Iconsax.password_check,
                                        color: isDark
                                            ? JColors.blue
                                            : JColors.orange,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () => setState(() {
                                                isObscure = !isObscure;
                                              }),
                                          icon: Icon(
                                            isObscure
                                                ? Iconsax.eye_slash
                                                : Iconsax.eye,
                                            color: isDark
                                                ? JColors.blue
                                                : JColors.orange,
                                          )),
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //       JSizes.borderRadiusXLg),
                                      // ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              JSizes.borderRadiusXLg),
                                          borderSide: BorderSide(
                                              color: isDark
                                                  ? JColors.blue
                                                  : JColors.orange,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
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
                                    ),
                                    Text(
                                      JText.forgetPassword,
                                      style: TextStyle(
                                          color: isDark
                                              ? JColors.blue
                                              : JColors.orange,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: JSizes.spaceBtwSections,
                          ),
                          MainButton(
                              buttonText: JText.login,
                              onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoryScreen(),
                                  )),
                              isDark: isDark),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                JText.notHaveAccount,
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
                                            const SignupScreen(),
                                      )),
                                  child: Text(
                                    JText.signUp,
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
        ));
  }
}