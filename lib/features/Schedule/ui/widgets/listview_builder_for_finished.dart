import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedBlood extends StatefulWidget {
  const FinishedBlood({super.key});

  @override
  State<FinishedBlood> createState() => _FinishedBloodState();
}

class _FinishedBloodState extends State<FinishedBlood> {
  List data = [
    {
      'nameOfCenter': "Tanta Center",
      'date': 'Fri,24Oct,2023',
      'time': "4:00 AM",
      "type": "blood"
    },
    {
      'nameOfCenter': "Tanta Center",
      'date': 'Fri,24Oct,2023',
      'time': "4:00 AM",
      "type": "plasma"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
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
                                "${data[i]['nameOfCenter']}",
                                style: TextStyles.font16K7lybold,
                              ),
                              Text(
                                "${data[i]['date']}",
                                style: TextStyles.font14mainK7lyMedium,
                              )
                            ],
                          ),
                          Text(
                            "${data[i]['time']}",
                            style: TextStyles.font16K7lybold,
                          )
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
                                "${data[i]['nameOfCenter']}",
                                style: TextStyles.font16K7lybold,
                              ),
                              Text(
                                "${data[i]['date']}",
                                style: TextStyles.font14mainK7lyMedium,
                              )
                            ],
                          ),
                          Text(
                            "${data[i]['time']}",
                            style: TextStyles.font16K7lybold,
                          )
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
