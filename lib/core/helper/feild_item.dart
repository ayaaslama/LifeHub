import "package:flutter/material.dart";

class FieldItem {
  final String fieldName;
  final GlobalKey<FormState>? formKey;
  final bool useicon;
  final bool useSuffixIcon;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? borderSideColor;
  final TextEditingController myController;
final void Function(String)? onChanged;
  FieldItem({
    required this.fieldName,
    this.borderSideColor,
    this.formKey,
    this.useicon = false,
    this.useSuffixIcon = false,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    required this.myController,
  this.onChanged,
  });
}
