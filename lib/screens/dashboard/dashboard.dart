import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/auth/choice_screen.dart';
import 'package:journo/screens/dashboard/screens/favorites/favorites.dart';
import 'package:journo/screens/dashboard/screens/home/home.dart';
import 'package:journo/screens/dashboard/screens/notification/notification.dart';
import 'package:journo/screens/dashboard/screens/save/save.dart';
import 'package:journo/screens/dashboard/screens/user_profile/user_profile.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

import '../../utils/constants/text_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var selectedIndex = 0;

  static final List<Widget> screens = [
    const HomeScreen(),
    const SaveScreen(),
    const FavoritesScreen(),
    const NotificationScreen(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final width = JHelper.screenWidth(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: JSizes.defaultSpace, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage(isDark
                          ? JImages.splashIconDark
                          : JImages.splashIconLight),
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfileScreen(),
                          )),
                      child: CircleAvatar(
                        maxRadius: 22.5,
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset(
                            JImages.maleProfile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                /// Search Form Field
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        JText.searchT,
                        style: TextStyle(
                            color: isDark ? JColors.white : JColors.black),
                      ),
                      prefixIcon: Icon(
                        Iconsax.search_normal,
                        color: isDark ? JColors.blue : JColors.orange,
                      ),
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
              ],
            ),
          ),
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: isDark ? JColors.black : JColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navBarItems(Iconsax.home_24, 0, isDark),
            navBarItems(Iconsax.save_2, 1, isDark),
            const SizedBox(
              width: 20,
            ),
            navBarItems(Iconsax.heart, 2, isDark),
            navBarItems(Iconsax.notification, 3, isDark),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: isDark ? JColors.blue : JColors.orange,
          elevation: 10,
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChoiceScreen(
                    role: "Creator",
                  ),
                )),
            child: const SizedBox(
              height: 56,
              width: 56,
              child: Icon(
                Iconsax.add,
                color: JColors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // resizeToAvoidBottomInset: false, // This line prevents the FAB from moving up with the keyboard
    );
  }

  Widget navBarItems(IconData icon, int index, bool isDark) {
    return InkWell(
      onTap: () => onItemTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 28),
        child: Icon(
          icon,
          color: selectedIndex == index
              ? isDark
                  ? JColors.blue
                  : JColors.orange
              : isDark
                  ? JColors.white
                  : JColors.black,
        ),
      ),
    );
  }
}
