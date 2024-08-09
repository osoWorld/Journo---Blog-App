import 'package:flutter/material.dart';
import 'package:journo/screens/admin/dashboard/admin_dashboard.dart';
import 'package:journo/screens/category/category.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key, required this.role});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
  final String role;
}

class _GenderScreenState extends State<GenderScreen> {
  var selectedGender = "";

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final blOra = isDark ? JColors.blue : JColors.orange;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              JText.selectGender,
              style: TextStyle(
                  color: blOra, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    selectedGender = "male";
                  }),
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                      maxRadius: 130,
                      backgroundColor: isDark
                          ? (selectedGender == "male"
                              ? JColors.blue.withOpacity(0.9)
                              : JColors.black2)
                          : (selectedGender == "male"
                              ? JColors.orange.withOpacity(0.9)
                              : JColors.white2),
                      child: const Image(
                        image: AssetImage(JImages.maleProfile),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    selectedGender = "female";
                  }),
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                      maxRadius: 130,
                      backgroundColor: isDark
                          ? (selectedGender == "female"
                              ? JColors.blue.withOpacity(0.9)
                              : JColors.black2)
                          : (selectedGender == "female"
                              ? JColors.orange.withOpacity(0.9)
                              : JColors.white2),
                      child: const Image(
                        image: AssetImage(JImages.femaleProfile),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections * 2,
            ),
            MainButton(
                buttonText: "Next",
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget.role == "Creator"
                          ? const AdminDashboardScreen()
                          : const CategoryScreen(),
                    )),
                isDark: isDark)
          ],
        ),
      ),
    );
  }
}
