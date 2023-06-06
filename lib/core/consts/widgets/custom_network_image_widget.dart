import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/widgets/app_loader_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String? url;
  final double? size;
  final double borderRadius;
  const CustomNetworkImageWidget(
      {Key? key, this.url, this.size, this.borderRadius = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ??
          'https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg',
      imageBuilder: (context, imageProvider) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
        );
      },
      progressIndicatorBuilder: ((context, url, progress) {
        return Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: AppColors.grey),
          child: const AppLoaderWidget(
            color: Colors.white,
          ),
        );
      }),
    );
  }
}
