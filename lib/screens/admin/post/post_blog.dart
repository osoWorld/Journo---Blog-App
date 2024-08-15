import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class PostBlogScreen extends StatefulWidget {
  const PostBlogScreen({super.key});

  @override
  State<PostBlogScreen> createState() => _PostBlogScreenState();
}

class _PostBlogScreenState extends State<PostBlogScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final darkColor1 = isDark ? JColors.blue : JColors.orange;
    final darkColor2 = isDark ? JColors.black2 : JColors.white2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          JText.postsAddPost,
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Iconsax.tick_circle,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: darkColor2,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 380,
                    child: Stack(
                      children: [
                        Image.asset(
                          isDark
                              ? JImages.uploadBlogDark
                              : JImages.uploadBlogLight,
                          fit: BoxFit.cover,
                          height: 380,
                        ),
                        Positioned(
                            right: 15,
                            bottom: 15,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: darkColor1,
                              size: 30,
                            )),
                      ],
                    )),
              ),
              const SizedBox(height: JSizes.spaceBtwSections,),

              Form(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: JColors.black),
                      decoration: InputDecoration(
                          label: Text(
                            JText.catModeTitle,
                            style: TextStyle(
                                color: isDark
                                    ? JColors.blue
                                    : JColors.orange),
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
                    const SizedBox(height: JSizes.spaceBtwItems,),

                    TextFormField(
                      style: const TextStyle(color: JColors.black),
                      decoration: InputDecoration(
                          label: Text(
                            JText.catModeSlug,
                            style: TextStyle(
                                color: isDark
                                    ? JColors.blue
                                    : JColors.orange),
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

                    const SizedBox(height: JSizes.defaultSpace,),

                    Card(
                      color: isDark ? JColors.black : JColors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(JText.postsTags, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                            Icon(Icons.navigate_next_rounded,)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: JSizes.spaceBtwItems / 2,),

                    Card(
                      color: isDark ? JColors.black : JColors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(JText.postsCategories, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),),
                            Icon(Icons.navigate_next_rounded,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}