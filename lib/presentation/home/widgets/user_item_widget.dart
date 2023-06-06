import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:behype_test/core/consts/widgets/custom_network_image_widget.dart';
import 'package:behype_test/data/model/unsplash_collections_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserItemWidget extends StatelessWidget {
  final User user;
  final Function() onTap; 
  const UserItemWidget({super.key, required this.user , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CustomNetworkImageWidget(
            borderRadius: 50,
            size: 8.h,
            url: user.profileImage.medium,
          ),
          const SizedBox(height: 4),
          Text(
            user.username,
            style: AppTextStyles.subtitle.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}
