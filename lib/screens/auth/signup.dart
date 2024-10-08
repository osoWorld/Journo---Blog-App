import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/auth/gender.dart';
import 'package:journo/screens/auth/login.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.role});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
  final String role;
}

class _SignupScreenState extends State<SignupScreen> {
  var isObscurePass = true;
  var isObscureConfirmPass = true;
  final _formKey = GlobalKey<FormState>();
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? JColors.blue : JColors.orange,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage(JImages.splashIconDark)),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 30),
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(JSizes.borderRadiusXLg * 2.5),
                      topRight: Radius.circular(JSizes.borderRadiusXLg * 2.5),
                    ),
                    color: JColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: JSizes.appBarHeight,
                      horizontal: JSizes.spaceBtwSections,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          JText.signUp,
                          style: TextStyle(
                            color: isDark ? JColors.blue : JColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: JSizes.spaceBtwItems / 2,
                        ),
                        Text(
                          widget.role == "Creator" ? JText.forCreators : "",
                          style: TextStyle(
                              color: isDark ? JColors.blue : JColors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: JSizes.spaceBtwSections,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    label: Text(
                                      JText.yourName,
                                      style: TextStyle(
                                          color: isDark
                                              ? JColors.blue
                                              : JColors.orange),
                                    ),
                                    prefixIcon: Icon(
                                      Iconsax.user,
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                    ),
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
                                height: JSizes.defaultSpace,
                              ),
                              TextFormField(
                                style: const TextStyle(color: JColors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    JText.email,
                                    style: TextStyle(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Iconsax.direct,
                                    color:
                                        isDark ? JColors.blue : JColors.orange,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: JSizes.defaultSpace,
                              ),
                              TextFormField(
                                obscureText: isObscurePass,
                                style: const TextStyle(color: JColors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    JText.password,
                                    style: TextStyle(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Iconsax.lock,
                                    color:
                                        isDark ? JColors.blue : JColors.orange,
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
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: JSizes.defaultSpace,
                              ),
                              TextFormField(
                                obscureText: isObscureConfirmPass,
                                style: const TextStyle(color: JColors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    JText.confirmPassword,
                                    style: TextStyle(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Iconsax.lock,
                                    color:
                                        isDark ? JColors.blue : JColors.orange,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() {
                                      isObscureConfirmPass =
                                          !isObscureConfirmPass;
                                    }),
                                    icon: Icon(
                                      isObscureConfirmPass
                                          ? Iconsax.eye_slash
                                          : Iconsax.eye,
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        JSizes.borderRadiusXLg),
                                    borderSide: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: JSizes.spaceBtwItems / 1.5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) => setState(() {
                                      isChecked = value ?? false;
                                    }),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    checkColor: Colors.white,
                                    activeColor:
                                        isDark ? JColors.blue : JColors.orange,
                                    side: BorderSide(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      width: 2,
                                    ),
                                  ),
                                  Text(
                                    JText.rememberMe,
                                    style: TextStyle(
                                      color: isDark
                                          ? JColors.blue
                                          : JColors.orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: JSizes.spaceBtwSections,
                        ),
                        MainButton(
                          buttonText: JText.signUp,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GenderScreen(role: widget.role,),
                                ));
                          },
                          isDark: isDark,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              JText.alreadyHaveAccount,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: isDark ? JColors.blue : JColors.orange,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                    role: widget.role,
                                  ),
                                ),
                              ),
                              child: Text(
                                JText.login,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: isDark ? JColors.blue : JColors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}