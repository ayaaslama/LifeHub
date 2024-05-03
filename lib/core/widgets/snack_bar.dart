import 'package:blood_life/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(String msg, Color color) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      msg,
      style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  );

  scaffoldKey.currentState?.showSnackBar(snackBar);
}
