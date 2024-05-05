import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonatingWhatToExcept extends StatelessWidget {
  const DonatingWhatToExcept({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Donating -What to expect",
                style: TextStyles.font16K7lybold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 75.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ManagerColor.lightRed,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.beforDonate);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            "assets/images/Rectangle 6654.png",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text("Befor",
                              style: TextStyles.font14mainK7lysemiBold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 75.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ManagerColor.lightBlue,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.inCenter);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            "assets/images/Rectangle 6656.png",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text("In_Center",
                              style: TextStyles.font14mainK7lysemiBold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 75.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ManagerColor.lightRed,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.afterDonate);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            "assets/images/Rectangle 6658.png",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text("After",
                              style: TextStyles.font14mainK7lysemiBold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
