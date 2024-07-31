import 'dart:math';

import 'package:flutter/material.dart';

import 'on_boarding_page.dart';

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
      OnboardingPage(
        image: "assets/images/certification.png",
        // Add your asset paths
        title: 'Certification and Badges',
        description: 'Earn a certificate after completion of every course',
      ),
      OnboardingPage(
        image: 'assets/images/progress_tracking.png',
        title: 'Progress Tracking',
        description: 'Check your Progress of every course',
      ),
      OnboardingPage(
        image: 'assets/images/offline_access.png',
        title: 'Offline Access',
        description: 'Make your course available offline',
      ),
      OnboardingPage(
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
            child: const Text('Skip'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _buildPages(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(_buildPages().length, (index) => buildDot(index)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _currentPage < 3 ? _nextPage : null,
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
            height: 10 * zoom,
            width: 10 * zoom,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.black : Colors.grey,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
