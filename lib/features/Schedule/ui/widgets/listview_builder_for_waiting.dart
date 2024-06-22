import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class Waiting extends StatefulWidget {
  const Waiting({super.key});

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  List<dynamic> _data = [];
  final secureStorage = const FlutterSecureStorage();

  late Crud crud;

  @override
  void initState() {
    super.initState();
    crud = Crud();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        final List<dynamic> dataList = await crud
            .fetchData("$linkServerName/Schedule-waiting?email=$storedEmail");
        setState(() {
          _data = dataList;
        });
      } else {
        print('No stored email found');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: _data.length,
          itemBuilder: (context, i) {
            final data = _data[i];
            final dTypeOfDonation = data['dTypeOfDonation'];
            final bloodBank = data['bloodBank'];
            final type = data['type'];
            final dateFormat = DateFormat('MM/dd/yyyy');
            final date = dateFormat.format(dateFormat.parse(data['date1']));
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: dTypeOfDonation == "Plasma"
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
                                    bloodBank,
                                    style: TextStyles.font16K7lybold,
                                  ),
                                  Text(
                                    type,
                                    style: TextStyles.font14mainK7lyMedium,
                                  )
                                ],
                              ),
                              Text(
                                date,
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
                                    bloodBank,
                                    style: TextStyles.font16K7lybold,
                                  ),
                                  Text(
                                    type,
                                    style: TextStyles.font14mainK7lyMedium,
                                  )
                                ],
                              ),
                              Text(
                                date,
                                style: TextStyles.font16K7lybold,
                              )
                            ],
                          ),
                        ),
                ),
              ],
            );
          }),
    );
  }
}
