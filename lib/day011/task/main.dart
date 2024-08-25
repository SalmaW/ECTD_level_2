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