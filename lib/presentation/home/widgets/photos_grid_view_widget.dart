import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:behype_test/core/consts/widgets/app_loader_widget.dart';
import 'package:behype_test/core/consts/widgets/custom_network_image_widget.dart';
import 'package:behype_test/data/model/unsplash_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PhotosGridViewWidget extends StatelessWidget {
  final PagingController<int, Photo> pagingController;
  final List<Photo> photos; 
  const PhotosGridViewWidget({super.key , required this.pagingController , required this.photos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PagedGridView<int, Photo>(
        pagingController: pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        builderDelegate: PagedChildBuilderDelegate<Photo>(
            firstPageProgressIndicatorBuilder: (context) =>
                const AppLoaderWidget(color: AppColors.grey),
            newPageProgressIndicatorBuilder: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Loading ..",
                        style: AppTextStyles.subtitle
                            .copyWith(color: AppColors.black)),
                    const AppLoaderWidget(color: AppColors.grey),
                  ],
                ),
            noItemsFoundIndicatorBuilder: (context) => Text(
                "Sorry , nothing found",
                style: AppTextStyles.subtitle.copyWith(color: AppColors.black)),
            noMoreItemsIndicatorBuilder: (context) => Text(
                "No more items here ",
                style: AppTextStyles.subtitle.copyWith(color: AppColors.black)),
            itemBuilder: (context, item, index) => CustomNetworkImageWidget(
                size: 100, url: photos[index].urls.regular)),
      ),
    );
  }
}
