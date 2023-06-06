import 'package:behype_test/core/consts/style/app_colors.dart';
import 'package:behype_test/core/consts/style/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Color? backgroundColor;
  final int maxLines;
  final int? maxLength;
  final String hint;
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? customValidator;
  final void Function(String)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final bool isObscure;
  final Widget? suffixIcon;
  final bool isEnabledBorder;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  const CustomTextField(
      {Key? key,
      this.backgroundColor = AppColors.grey94,
      this.maxLines = 1,
      this.maxLength,
      required this.hint,
      this.inputFormatters,
      this.customValidator,
      this.borderColor = AppColors.emerald,
      this.controller,
      this.isObscure = false,
      this.suffixIcon,
      this.isEnabledBorder = false,
      this.onChanged,
      this.textCapitalization = TextCapitalization.none,
      this.readOnly = false,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late GlobalKey<FormState> keyForm;

  @override
  void initState() {
    keyForm = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: TextFormField(
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          autocorrect: true,
          controller: widget.controller,
          obscureText: widget.isObscure,
          textCapitalization: widget.textCapitalization,
          style: AppTextStyles.subtitle.copyWith(color: AppColors.black),
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
              filled: true,
              fillColor: widget.backgroundColor,
              suffixIcon: widget.suffixIcon,
              counterStyle:
                  AppTextStyles.subtitle.copyWith(color: AppColors.emerald),
              errorStyle:
                  AppTextStyles.subtitle2.copyWith(color: AppColors.error),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.error)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: widget.borderColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: widget.borderColor)),
              contentPadding: const EdgeInsets.all(16),
              enabledBorder: widget.isEnabledBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: widget.borderColor))
                  : null,
              hintText: widget.hint,
              hintStyle:
                  AppTextStyles.subtitle.copyWith(color: AppColors.grey38)),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.customValidator),
    );
  }
}
