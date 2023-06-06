import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionIcon;
  final TextStyle? textStyle;
  final bool centerTitle;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final Widget? leading;
  const CustomAppBar(
      {Key? key,
      this.title,
      this.actionIcon,
      this.centerTitle = true,
      this.textStyle,
      this.backgroundColor,
      this.leading,
      this.titleWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: backgroundColor ?? AppColors.white,
        elevation: 0,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        title: titleWidget ??
            Text(title ?? '',
                style: textStyle ??
                    AppTextStyles.headerBold.copyWith(color: AppColors.black)),
        leading: leading,
        actions: [actionIcon ?? const SizedBox()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
