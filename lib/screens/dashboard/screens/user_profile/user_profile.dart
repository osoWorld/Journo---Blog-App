import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var isObscure = true;
  bool _hasChanges = false;

  // Controllers for text fields
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add listeners to track changes
    _nameController.addListener(_onTextChanged);
    _bioController.addListener(_onTextChanged);
    _emailController.addListener(_onTextChanged);
    _passwordController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Dispose of the controllers
    _nameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    // Set the state to reflect that changes have been made
    setState(() {
      _hasChanges = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final width = JHelper.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: isDark ? JColors.black2 : JColors.white2,
      body: Padding(
        padding: const EdgeInsets.only(
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace,
            bottom: JSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 44.5,
                child: ClipOval(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      JImages.maleProfile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              Text(
                JText.demoName,
                style: TextStyle(
                    color: isDark ? JColors.blue : JColors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections / 2,
              ),
              Text(
                JText.demoBio,
                style: TextStyle(
                  color: isDark ? JColors.blue : JColors.orange,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "6",
                        style: TextStyle(
                            color: isDark ? JColors.blue : JColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(
                            color: isDark ? JColors.blue : JColors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "13",
                        style: TextStyle(
                            color: isDark ? JColors.blue : JColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Followings',
                        style: TextStyle(
                            color: isDark ? JColors.blue : JColors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      JText.profileEdit,
                      style: TextStyle(
                          color: isDark ? JColors.blue : JColors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          label: Text(
                            JText.yourName,
                            style: TextStyle(
                              color: isDark ? JColors.blue : JColors.orange,
                            ),
                          ),
                          prefixIcon: Icon(
                            Iconsax.user,
                            color: isDark ? JColors.blue : JColors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(JSizes.borderRadiusXLg),
                            borderSide: BorderSide(
                                color: isDark ? JColors.blue : JColors.orange,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusXLg),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2))),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: _bioController,
                      decoration: InputDecoration(
                          label: Text(
                            JText.yourBio,
                            style: TextStyle(
                              color: isDark ? JColors.blue : JColors.orange,
                            ),
                          ),
                          prefixIcon: Icon(
                            Iconsax.instagram,
                            color: isDark ? JColors.blue : JColors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(JSizes.borderRadiusXLg),
                            borderSide: BorderSide(
                                color: isDark ? JColors.blue : JColors.orange,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusXLg),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2))),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          label: Text(
                            JText.email,
                            style: TextStyle(
                              color: isDark ? JColors.blue : JColors.orange,
                            ),
                          ),
                          prefixIcon: Icon(
                            Iconsax.sms,
                            color: isDark ? JColors.blue : JColors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(JSizes.borderRadiusXLg),
                            borderSide: BorderSide(
                                color: isDark ? JColors.blue : JColors.orange,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusXLg),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2))),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          label: Text(
                            JText.password,
                            style: TextStyle(
                                color: isDark ? JColors.blue : JColors.orange),
                          ),
                          prefixIcon: Icon(
                            Iconsax.password_check,
                            color: isDark ? JColors.blue : JColors.orange,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    isObscure = !isObscure;
                                  }),
                              icon: Icon(
                                isObscure ? Iconsax.eye_slash : Iconsax.eye,
                                color: isDark ? JColors.blue : JColors.orange,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusXLg),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(JSizes.borderRadiusXLg),
                              borderSide: BorderSide(
                                  color: isDark ? JColors.blue : JColors.orange,
                                  width: 2))),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwSections * 1.5,
                    ),
                    SizedBox(
                      width: width * 0.7,
                      height: 52,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _hasChanges ? JColors.orange : Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      JSizes.borderRadiusLg))),
                          onPressed: _hasChanges ? () => {} : null,
                          child: const Text(
                            "Update Profile",
                            style: TextStyle(
                                fontSize: JSizes.md,
                                fontWeight: FontWeight.w600,
                                color: JColors.white),
                          )),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems / 2,
                    ),
                    MainButton(
                        buttonText: "Logout",
                        onPressed: () => {},
                        isDark: isDark)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
