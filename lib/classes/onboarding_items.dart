import 'package:journo/utils/constants/image_strings.dart';
import 'package:journo/utils/constants/text_strings.dart';
import 'package:journo/widgets/onboarding/onboardingpage.dart';

class OnboardingItems {
  List<OnBoardingPage> item = [
    OnBoardingPage(image: JImages.onBoardingImage1, description: JText.onBoardingDescription1),
    OnBoardingPage(image: JImages.onBoardingImage2, description: JText.onBoardingDescription2),
    OnBoardingPage(image: JImages.onBoardingImage3, description: JText.onBoardingDescription3),
  ];
}