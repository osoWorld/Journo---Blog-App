import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int activeIndex = 0;

  final List<String> images = [
    JImages.adminNetflix,
    JImages.adminWhatsapp,
    JImages.adminMacBook,
    JImages.adminSmartWatch,
    JImages.adminCoding
  ];

  final List<String> titles = [
    JText.titleNetflix,
    JText.titleWhatsapp,
    JText.titleMacBook,
    JText.titleSmartWatch,
    JText.titleCoding
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.only(
            top: JSizes.defaultSpace,
            left: JSizes.defaultSpace,
            right: JSizes.defaultSpace),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 210,
                child: CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final sliderImage = images[index];
                      return buildImage(sliderImage, index);
                    },
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) => setState(() {
                        activeIndex = index;
                      }),
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            buildIndicator(isDark),
            const SizedBox(
              height: JSizes.spaceBtwSections,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  JText.latestPost,
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  child: Text(
                    JText.seeAll,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4,),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Iconsax.clock,
                                      color: Colors.blueGrey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      JText.postTime,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      JText.postViews,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    IconButton(
                                        onPressed: () => {},
                                        icon: const Icon(
                                          Iconsax.save_2,
                                          size: 18,
                                          color: Colors.grey,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator(bool isDark) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: ExpandingDotsEffect(
            dotWidth: 14,
            dotHeight: 10,
            activeDotColor: isDark ? JColors.blue : JColors.orange),
      );
}
