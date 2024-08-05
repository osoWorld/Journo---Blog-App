import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var selectedIndex = 0;

  static final List<Widget> screens = [
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.orange,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.deepPurple,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.limeAccent,
    ),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(isDark
                        ? JImages.splashIconDark
                        : JImages.splashIconLight),
                    height: 30,
                  ),
                  CircleAvatar(
                    maxRadius: 45,
                    child: ClipOval(
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Image.asset(
                          JImages.profilePlaceHolder,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: JColors.white,
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
          child: const InkWell(
            child: SizedBox(
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
    );
  }

  Widget navBarItems(IconData icon, int index, bool isDark) {
    return InkWell(
      onTap: () => onItemTap(index),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 28),
            child: Icon(
              icon,
              color: selectedIndex == index
                  ? isDark
                      ? JColors.blue
                      : JColors.orange
                  : JColors.black,
            ),
          ),
        ],
      ),
    );
  }
}