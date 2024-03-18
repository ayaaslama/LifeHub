import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DonationRequest extends StatelessWidget {
  const DonationRequest(
      {super.key,
      required this.nameHospital,
      required this.time,
      required this.bloodName,
      required this.image});

  final String nameHospital;
  final String time;
  final String bloodName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 16.0, right: 16.0),
      child: Container(
        width: 363,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(217, 217, 217, 1),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                image,
                height: 70,
                width: 70,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Donate And Save Life",
                          style: TextStyles.font16K7lybold),
                      Text(nameHospital, style: TextStyles.font13GreyRegular),
                      Text(time, style: TextStyles.font13GreyRegular),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10.0),
                        child: AppTextButton(
                          textButton: "Donate Now",
                          onPressed: () {
                            Navigator.pushNamed(context, '/donation');
                          },
                          backgroundColor: ManagerColor.mainred,
                          buttonWidth: 200.w,
                          buttonHeight: 46.h,
                          verticalPadding: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                bloodName,
                style: TextStyles.font24mainRedbold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
