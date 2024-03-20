import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationRequest extends StatelessWidget {
  const DonationRequest({
    super.key,
    required this.nameHospital,
    required this.time,
    required this.bloodName,
  });

  final String nameHospital;
  final String time;
  final String bloodName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 16.0, right: 16.0),
      child: Container(
        width: 363,
        height: 115.h,
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nameHospital,
                              style: TextStyles.font14mainK7lysemiBold),
                          Text(time, style: TextStyles.font13GreyRegular),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: AppTextButton(
                  textButton: "Donate Now",
                  onPressed: () {
                    Navigator.pushNamed(context, '/donation');
                  },
                  backgroundColor: ManagerColor.mainred,
                  buttonWidth: 200.w,
                  buttonHeight: 46.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
