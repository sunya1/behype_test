import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class CustomFilledButton extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final Color? color;
  final double? borderRadius;
  final Color? textColor;
  final Widget? child;
  final double verticalPadding;
  final double horizontalPadding;
  final TextStyle textStyle;
  const CustomFilledButton(
      {Key? key,
      this.title,
      this.onPressed,
      this.color = AppColors.emerald,
      this.borderRadius = 20,
      this.textColor = AppColors.white,
      this.child,
      this.horizontalPadding = 8,
      this.textStyle = AppTextStyles.titleBold,
      this.verticalPadding = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      borderRadius: BorderRadius.circular(borderRadius!),
      color: color,
      disabledColor: color!.withOpacity(0.7),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: child ??
            Text(
              title!,
              style: textStyle.copyWith(color: textColor),
            ),
      ),
    );
  }
}
