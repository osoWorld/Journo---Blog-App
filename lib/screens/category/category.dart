import 'package:flutter/material.dart';
import 'package:journo/screens/category/classes/category_utils.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    // Initialize the isSelected list based on the number of category items
    isSelected = List<bool>.filled(JCategoryUtils.categoryItems.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final height = JHelper.screenHeight(context);
    final width = JHelper.screenWidth(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: JSizes.appBarHeight * 2,
            horizontal: JSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// AppIcon
            SizedBox(
              width: width,
              child: Image(
                image: AssetImage(
                  isDark ? JImages.splashIconDark : JImages.splashIconLight,
                ),
                alignment: Alignment.center,
              ),
            ),

            const SizedBox(
              height: JSizes.appBarHeight,
            ),

            /// Title
            Text(
              JText.selectCategoryTitle,
              style: TextStyle(
                  color: isDark ? JColors.blue : JColors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),

            const SizedBox(
              height: 12,
            ),

            /// Description
            Text(
              JText.selectCategoryDescription,
              style: TextStyle(
                  color: isDark ? JColors.blue : JColors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),

            const SizedBox(
              height: JSizes.appBarHeight,
            ),

            /// Chips
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: List<Widget>.generate(
                  JCategoryUtils.categoryItems.length, (index) {
                return RawChip(
                  label: Padding(padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8), child: Text(
                    JCategoryUtils.categoryItems[index],
                    style: TextStyle(
                      color: isSelected[index]
                          ? JColors.white
                          : isDark
                          ? JColors.blue
                          : JColors.orange,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),),
                  selected: isSelected[index],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(
                      color: (isDark ? JColors.blue : JColors.orange),
                      width: 2,
                    ),
                  ),

                  selectedColor: isDark ? JColors.blue : JColors.orange,
                  backgroundColor: Colors.transparent,
                  showCheckmark: false,
                  onSelected: (value) => setState(() {
                    isSelected[index] = value;
                  }),
                );
              }),
            ),

            const SizedBox(
              height: JSizes.appBarHeight,
            ),

            MainButton(
                buttonText: JText.continueT, onPressed: () {}, isDark: isDark),
          ],
        ),
      ),
    );
  }
}