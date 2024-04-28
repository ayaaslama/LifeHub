import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomeBloodPlasma extends StatelessWidget {
  final String? assetName;
  final String? text1;
  final String? text2;
  final String? text3;
  final Color? color;
  final Color? color1;
  final double? width;
  final void Function()? onpressed1;
  final Widget? appTextButtonBloodPlasma;

  const CustomeBloodPlasma(
      {super.key,
      this.assetName,
      this.text1,
      this.text2,
      this.appTextButtonBloodPlasma,
      this.text3,
      this.color,
      this.width,
      this.onpressed1,
      this.color1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                assetName ?? "assets/svgs/blood.svg",
                color: color1 ?? ManagerColor.mainred,
              ),
              Text(
                text1 ?? 'Allow 1 hours for your visit ',
                style: TextStyles.font16GreysemiBold,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text2 ?? 'Blood', style: TextStyles.font18K7lybold),
              AppTextButton(
                  buttonWidth: 213.w,
                  buttonHeight: 50.h,
                  textButton: text3 ?? 'Book Now',
                  textStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
                  backgroundColor: color ?? ManagerColor.mainred,
                  onPressed: onpressed1 ??
                      () => context.pushNamed(Routes.bookBloodScreen)),
            ],
          )
        ],
      ),
    );
  }
}
