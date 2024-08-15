import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/screens/admin/dashboard/admin_screens/admin_home.dart';
import 'package:journo/screens/admin/dashboard/admin_screens/category/category.dart';
import 'package:journo/screens/admin/dashboard/admin_screens/profile/admin_profile.dart';
import 'package:journo/screens/admin/dashboard/admin_screens/tags/admin_tag.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key, this.initialIndex = 0});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
  final int initialIndex;
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  var selectedIndex = 0;

  static final List<Widget> screens = [
    const AdminHomeScreen(),
    const AdminCategoryScreen(),
    const AdminTagsScreen(),
    const AdminProfileScreen(),
  ];

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  void onItemTap (int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: isDark ? JColors.black : JColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navBarItems(0, Iconsax.category, isDark),
            navBarItems(1, Iconsax.tag, isDark),
            const SizedBox(width: 40,),
            navBarItems(2, Iconsax.hashtag, isDark),
            navBarItems(3, Iconsax.user, isDark)
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: isDark ? JColors.blue : JColors.orange,
          elevation: 2,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget navBarItems(int index, IconData icon, bool isDark) {
    return InkWell(
      onTap: () => onItemTap(index),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 28),
          child: Icon(
            icon,
            color: selectedIndex == index
                ? (isDark ? JColors.blue : JColors.orange)
                : (isDark ? JColors.white : JColors.black),
          )),
    );
  }
}