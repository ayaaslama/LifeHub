import "package:flutter/material.dart";

class FieldItem {
  final String fieldName;
  final bool useicon;
  final bool useSuffixIcon;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? borderSideColor;
  final TextEditingController? myController;
  final void Function(String)? onChanged;
  final void Function(String?)? onSave;
  final void Function(String?)? onSubmitted;
  final bool? enable;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  FieldItem({
    this.focusNode,
    this.onSave,
    this.onSubmitted,
    this.enable = true,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    required this.fieldName,
    this.borderSideColor,
    this.useicon = false,
    this.useSuffixIcon = false,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.myController,
    this.onChanged,
  });
}
