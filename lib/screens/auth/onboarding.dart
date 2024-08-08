import 'package:flutter/material.dart';
import 'package:journo/classes/onboarding_items.dart';
import 'package:journo/screens/auth/choice_screen.dart';
import 'package:journo/utils/constants/colors.dart';
import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/sizes.dart';
import 'package:journo/utils/helpers/helper_functions.dart';
import 'package:journo/widgets/common/buttons/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:journo/widgets/common/buttons/text_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final isDark = JHelper.isDarkMode(context);
    final controller = OnboardingItems();
    final pageController = PageController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: JSizes.spaceBtwSections * 2,
            horizontal: JSizes.defaultSpace),
        child: Column(
          children: [
            Center(
                child: Image(
                    image: AssetImage(isDark
                        ? JImages.splashIconDark
                        : JImages.splashIconLight))),
            Expanded(
              child: PageView.builder(
                  itemCount: controller.item.length,
                  onPageChanged: (index) => setState(() {
                        isLastPage = index == controller.item.length - 1;
                      }),
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(controller.item[index].image),
                          height: 280,
                        ),
                        const SizedBox(
                          height: JSizes.spaceBtwSections,
                        ),
                        Text(
                          controller.item[index].description,
                          style: const TextStyle(
                              fontSize: JSizes.fontSizeMd,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.defaultSpace, vertical: JSizes.spaceBtwItems),
        color: isDark ? JColors.black : JColors.white,
        child: isLastPage
            ? MainButton(
                buttonText: 'Get Started',
                isDark: isDark,
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChoiceScreen(),
                    )),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JTextButton(
                    buttonText: 'Skip',
                    isDark: isDark,
                    onPressed: () => pageController.animateToPage(
                        controller.item.length - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.item.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                    effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: isDark ? JColors.blue : JColors.orange),
                  ),
                  JTextButton(
                    buttonText: 'Next',
                    isDark: isDark,
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                  )
                ],
              ),
      ),
    );
  }
}