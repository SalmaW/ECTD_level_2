import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../utils/color_utility.dart';
import '../utils/images_utility.dart';
import '../widgets/onBoarding/on_boarding_item.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: ColorUtility.scaffoldBackground,
        pageBackgroundColor: ColorUtility.scaffoldBackground,
        centerBackground: true,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: ColorUtility.secondary,
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(color: ColorUtility.deepGrey),
        ),
        trailing: const Text(
          'Login',
          style: TextStyle(color: ColorUtility.main),
        ),
        background: List.generate(4, (index) => const SizedBox()),
        totalPage: 4,
        speed: 1.8,
        controllerColor: ColorUtility.main,
        // indicatorPosition: MediaQuery.sizeOf(context).height / 3,
        addController: true,
        indicatorAbove: true,
        pageBodies: const [
          OnboardingItem(
            image: ImageUtility.certification,
            title: "Certification and Badges",
            subtitle: "Earn a certificate after completion of every course",
          ),
          OnboardingItem(
            image: ImageUtility.progressTracking,
            title: "Progress Tracking",
            subtitle: "Check your Progress of every course",
          ),
          OnboardingItem(
            image: ImageUtility.offlineAccess,
            title: "Offline Access",
            subtitle: "Make your course available offline",
          ),
          OnboardingItem(
            image: ImageUtility.courseCatalog,
            title: "Course Catalog",
            subtitle: "View in which courses you are enrolled",
          ),
        ],
      ),
    );
  }
}
