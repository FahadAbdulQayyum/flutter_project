// lib/components/custom_carousel.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final double height;
  final bool autoPlay;

  const CustomCarousel({
    Key? key,
    required this.imageUrls,
    this.height = 200.0,
    this.autoPlay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: autoPlay,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(imageUrl);
          },
        );
      }).toList(),
    );
  }
}
