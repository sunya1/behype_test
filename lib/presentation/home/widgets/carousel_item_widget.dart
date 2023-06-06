import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_images.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:behype_test/core/consts/widgets/custom_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.black),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Collection",
                  style: AppTextStyles.title.copyWith(color: AppColors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: Text(
                    "A discount for the first product",
                    style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.white, overflow: TextOverflow.visible),
                  ),
                ),
                CustomFilledButton(
                  title: 'Shop Now',
                  horizontalPadding: 12,
                  verticalPadding: 4,
                  textStyle: AppTextStyles.subtitle,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(child: Image.asset(AppImages.nike))
        ],
      ),
    );
  }
}
