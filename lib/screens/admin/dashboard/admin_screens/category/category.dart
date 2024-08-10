import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      JText.catSnapchat,
      JText.catProcessor,
      JText.catMacOS,
      JText.catNews,
      JText.catNewCategory,
      JText.catReviews,
      JText.catEntertainment,
      JText.catHeyCat,
      JText.catFoods,
    ];
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isDark ? JColors.blue : JColors.orange,
        title: const Text(
          JText.category,
          style: TextStyle(
            color: JColors.white,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Iconsax.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return Card(
              color: JColors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(" ${index + 1}"),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(categories[index])
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.edit,
                              color: JColors.green,
                            )),
                        IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.delete,
                              color: JColors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
