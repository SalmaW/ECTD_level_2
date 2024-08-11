import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/on_boarding_items.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPages() {
    return const [
      OnboardingItems(
        image: "assets/images/certification.png",
        // Add your asset paths
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            backgroundColor: const Color(0xffF7BA34),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            // Handle login or navigate to login page
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            'Log In',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xffF7BA34),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: _currentPage > 0
                                  ? () {
                                      _pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut);
                                    }
                                  : null,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xffF7BA34),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: _currentPage < 3 ? _nextPage : null,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
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
          double selectedness = Curves.easeOut.transform(
            max(
                0.0,
                1.0 -
                    (_pageController.page ??
                            _pageController.initialPage - index)
                        .abs()),
          );
          double zoom = 1.0 + (selectedness * 0.3);
          return Container(
            height: 3 * zoom,
            width: 22 * zoom,
            margin: const EdgeInsets.symmetric(horizontal: 0.5),
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.black : Colors.grey,
              shape: BoxShape.rectangle,
            ),
          );
        },
      ),
    );
  }
}
