import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? titleColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? iconColor;
  final List<Widget>? actions;

  CustomeAppBar({
    super.key,
    required this.text,
    this.color,
    this.titleColor,
    this.padding,
    this.textStyle,
    this.iconColor,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      iconTheme: IconThemeData(color: iconColor),
      elevation: 0,
      backgroundColor: color ?? ManagerColor.mainred,
      //centerTitle: true,
      title: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: titleColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
