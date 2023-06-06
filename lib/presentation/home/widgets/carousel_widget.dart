import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/presentation/home/widgets/carousel_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final CarouselController controller;
  final int currentPageIndex;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  const CarouselWidget(
      {super.key,
      required this.controller,
      required this.onPageChanged,
      required this.currentPageIndex});
  @override
  Widget build(BuildContext context) {
    final carouselItems = List.generate(5, (index) => const CarouselItemWidget());
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 200,
        child: CarouselSlider(
          items: carouselItems,
          carouselController: controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: 2.0,
              onPageChanged: onPageChanged),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: carouselItems.asMap().entries.map((entry) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPageIndex == entry.key
                    ? AppColors.emerald
                    : AppColors.black.withOpacity(0.2)),
          );
        }).toList(),
      ),
    ]);
  }
}
