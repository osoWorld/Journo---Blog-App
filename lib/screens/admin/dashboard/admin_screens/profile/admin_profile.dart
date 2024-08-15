import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/utils/helpers/helper_functions.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  final _scrollController = ScrollController();

  double _animatedContainer = 410.0;
  bool _showBio = true;

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

  void onScroll() {
    if(_scrollController.position.pixels > 50) {
      setState(() {
        _animatedContainer = 330;
        _showBio = false;
      });
    } else {
      setState(() {
        _animatedContainer = 410;
        _showBio = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? JColors.blue : JColors.orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          JText.profileForCreator,
          style: TextStyle(
              color: JColors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              height: _animatedContainer,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: isDark ? JColors.blue : JColors.orange,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: JSizes.defaultSpace,
                    right: JSizes.defaultSpace,
                    bottom: JSizes.defaultSpace,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.5,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            JImages.maleProfile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: JSizes.defaultSpace),
                      const Text(
                        JText.demoName,
                        style: TextStyle(
                            color: JColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        JText.demoEmail,
                        style: TextStyle(
                            color: JColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      const SizedBox(height: JSizes.spaceBtwItems),
                      if (_showBio)
                        const Text(
                          JText.demoBio,
                          style: TextStyle(
                              color: JColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: JSizes.spaceBtwSections),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "6",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: JSizes.spaceBtwItems / 3),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: JSizes.spaceBtwItems / 3),
                                Text(
                                  "Following",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: JSizes.spaceBtwItems / 3),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                      color: JColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: JSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.only(left: JSizes.defaultSpace),
              child: Text(
                JText.profileMyPost,
                style: TextStyle(
                    color: isDark ? JColors.white2 : JColors.black2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: JSizes.spaceBtwItems / 2),

            // Scrollable content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 500,
                child: GridView.builder(
                  itemCount: images.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                            height: 128,
                            width: 200,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    titles[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(
                                  Iconsax.menu,
                                  color: isDark ? JColors.white2 : JColors.black2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}