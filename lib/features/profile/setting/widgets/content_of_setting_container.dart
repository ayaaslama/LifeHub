import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentOfSetting extends StatelessWidget {
  const ContentOfSetting(
      {super.key, required this.text, required this.imageAsset});
  final String imageAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: SizedBox(
        height: 48.h,
        width: 327.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        imageAsset,
                        color: ManagerColor.maink7ly,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          text,
                          style: TextStyles.font14mainK7lyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ManagerColor.maink7ly,
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              height: 5,
              color: ManagerColor.lighterGrey,
            ),
          ],
        ),
      ),
    );
  }
}
