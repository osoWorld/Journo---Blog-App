import 'package:flutter/material.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: GridView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              color: isDark ? JColors.black2 : JColors.white2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        JImages.horizontalDemo,
                        fit: BoxFit.cover,
                        height: 230,
                      ),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    Text(
                      JText.demoBlogText,
                      style: TextStyle(
                          color: isDark ? JColors.blue : JColors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,),
                      maxLines: 4,
                        overflow: TextOverflow.ellipsis
                    ),

                    const SizedBox(height: JSizes.defaultSpace / 2,),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(JText.demoDate, style: TextStyle(color: JColors.textGrey, fontWeight: FontWeight.w600, fontSize: 9),),
                        CircleAvatar(
                          backgroundColor: JColors.dotGrey,
                          maxRadius: 2,
                        ),
                        Text(JText.demoRead, style: TextStyle(color: JColors.textGrey, fontWeight: FontWeight.w600, fontSize: 9),)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.47),
        ),
      ),
    );
  }
}
