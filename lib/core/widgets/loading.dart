import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
  });
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 52.h,
      width: width ?? 327.w,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          color: color ?? ManagerColor.mainred),
      child:
          const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
