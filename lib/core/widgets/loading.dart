import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: ManagerColor.mainred),
      child:
          const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
