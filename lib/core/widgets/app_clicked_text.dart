import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClicKedText extends StatelessWidget {
  final String text;
  final String onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  const ClicKedText(
      {required this.text,
      required this.onPressed,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(text,
            style: TextStyle(
              color: ManagerColor.mainred,
              fontSize: fontSize ?? 12.sp,
              fontWeight: fontWeight ?? FontWeight.w400,
            )),
        onTap: () {
          Navigator.pushNamed(context, onPressed);
        });
  }
}
