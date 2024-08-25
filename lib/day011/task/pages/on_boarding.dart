import 'package:ectd2/day011/task/pages/authentication/login_page.dart';
import 'package:ectd2/day011/task/pages/preferences_service.dart';
import 'package:flutter/material.dart';

import '../utils/color_utility.dart';
import '../widgets/elevated_button.dart';
import '../widgets/on_boarding_items.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPages() {
    return const [
      OnboardingItems(
        image: "assets/images/certification.png",
        title: 'Certification and Badges',
        description: 'Earn a certificate after completion of every course',
      ),
      OnboardingItems(
        image: 'assets/images/progress_tracking.png',
        title: 'Progress Tracking',
        description: 'Check your Progress of every course',
      ),
      OnboardingItems(
        image: 'assets/images/offline_access.png',
        title: 'Offline Access',
        description: 'Make your course available offline',
      ),
      OnboardingItems(
        image: 'assets/images/course_catalog.png',
        title: 'Course Catalog',
        description: 'View in which courses you are enrolled',
      ),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    _pageController.animateToPage(_currentPage + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  void _skip() {
    _pageController.animateToPage(_buildPages().length - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text(
                _buildPages().length - 1 == _currentPage ? 'Log IN' : 'Skip'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _buildPages(),
            ),
          ),
          Expanded(
            child: Column(
              children: _buildPages().length - 1 == _currentPage
                  ? [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17.0, vertical: 10),
                        child: ElevatedButtonW(
                          fixedSized: const Size(316, 57),
                          onPressed: onLogin,
                          custom: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              _buildPages().length, (index) => buildDot(index)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButtonW(
                                custom: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: _currentPage < 3 ? _nextPage : null),
                          ],
                        ),
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
      },
      child: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double zoom = 1.0 + 0.3;
          return Container(
            height: 3 * zoom,
            width: index == _currentPage ? 30 * zoom : 20 * zoom,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.secondary
                    : AppColors.mediumBlack,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5)),
          );
        },
      ),
    );
  }

  void onLogin() {
    PreferencesService.isOnboardingSeen = true;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }
}
