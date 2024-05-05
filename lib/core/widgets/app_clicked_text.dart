import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClicKedText extends StatelessWidget {
  final String text;
  final String routeName;

  final double? fontSize;
  final FontWeight? fontWeight;
  const ClicKedText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      required this.routeName});

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
          context.pushNamed(routeName);
        });
  }
}
