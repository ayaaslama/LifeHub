import 'package:flutter/material.dart';

import 'package:blood_life/core/theaming/color.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final int? horizentalPadding;
  final int? verticalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final String textButton;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final GlobalKey<FormState>? formKey;
  final Color? textColor;

  const AppTextButton({
    Key? key,
    this.borderRadius,
    this.backgroundColor,
    this.horizentalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.textButton,
    this.textStyle,
    this.onPressed,
    this.formKey,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? ManagerColor.mainred,
        ),
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 12, vertical: 14)),
        fixedSize: MaterialStateProperty.all(
            Size(buttonWidth ?? 250, buttonHeight ?? 50)),
      ),
      child: Text(
        textButton,
        style: textStyle ??
            TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: textColor ?? Colors.white),
      ),
    );
  }
}
