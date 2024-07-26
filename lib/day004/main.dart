import 'package:flutter/material.dart';

import '../day004/image_slider.dart';

void main() {
  runApp(const CarouselSliderApp());
}

class CarouselSliderApp extends StatelessWidget {
  const CarouselSliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel Slider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarouselSliderPage(),
    );
  }
}

class CarouselSliderPage extends StatelessWidget {
  final List<String> imgList = [
    'https://via.placeholder.com/600/92c952',
    'https://via.placeholder.com/600/771796',
    'https://via.placeholder.com/600/24f355',
    'https://via.placeholder.com/600/d32776',
    'https://via.placeholder.com/600/f66b97',
    'https://via.placeholder.com/600/56a8c2',
  ];

  CarouselSliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider Demo'),
      ),
      body: Center(
        child: ImageSlider(imgList: imgList),
      ),
    );
  }
}
