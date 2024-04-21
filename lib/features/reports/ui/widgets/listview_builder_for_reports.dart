import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List data = [
    {'numberOfReports': "Report1", 'date': 'Fri,24Oct,2023', "type": "blood"},
    {'numberOfReports': "Report2", 'date': 'Fri,24Oct,2023', "type": "plasma"},
    {'numberOfReports': "Report3", 'date': 'Fri,24Oct,2023', "type": "blood"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: data[i]['type'] == "plasma"
                  ? Container(
                      width: 320.w,
                      height: 77.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ManagerColor.lightPlasmaColor,
                        border: Border.all(
                          color: ManagerColor.plasmaColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/healthIcon.png',
                                color: ManagerColor.plasmaColor,
                              ),
                              Text(
                                'Plasma',
                                style: TextStyles.font16K7lybold,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${data[i]['numberOfReports']}",
                                style: TextStyles.font16K7lybold,
                              ),
                              Text(
                                "${data[i]['date']}",
                                style: TextStyles.font14mainK7lyMedium,
                              )
                            ],
                          ),
                          const AppTextButton(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textButton: 'open',
                              borderRadius: 20,
                              buttonHeight: 30,
                              buttonWidth: 56,
                              horizentalPadding: 0,
                              verticalPadding: 0),
                        ],
                      ),
                    )
                  : Container(
                      width: 320.w,
                      height: 77.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ManagerColor.lightRed,
                        border: Border.all(
                          color: ManagerColor.mainred,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/healthIcon.png',
                                color: ManagerColor.mainred,
                              ),
                              Text(
                                'Blood',
                                style: TextStyles.font16K7lybold,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${data[i]['numberOfReports']}",
                                style: TextStyles.font16K7lybold,
                              ),
                              Text(
                                "${data[i]['date']}",
                                style: TextStyles.font14mainK7lyMedium,
                              )
                            ],
                          ),
                          const AppTextButton(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              backgroundColor: ManagerColor.plasmaColor,
                              textButton: 'open',
                              borderRadius: 20,
                              buttonHeight: 30,
                              buttonWidth: 56,
                              horizentalPadding: 0,
                              verticalPadding: 0),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
