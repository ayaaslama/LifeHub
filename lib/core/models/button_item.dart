import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonItem {
  final double? borderRadius;
  final Color? backgroundColor;
  final int? horizentalPadding;
  final int? verticalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final String textButton;
  final Widget? textStyle;

  final VoidCallback? onPressed;

  const ButtonItem(
    this.textStyle, {
    this.borderRadius,
    this.backgroundColor,
    this.horizentalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.textButton,
    this.onPressed,
  });
}
