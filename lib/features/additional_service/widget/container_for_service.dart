import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerService extends StatelessWidget {
  const ContainerService(
      {super.key,
      required this.serviceName,
      required this.image,
      required this.onTap});
  final String serviceName;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 363,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ManagerColor.lighterGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 70,
                  width: 70,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  serviceName,
                  style: TextStyles.font18K7lybold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
