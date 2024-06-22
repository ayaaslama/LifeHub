import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DonationRequest extends StatefulWidget {
  DonationRequest({super.key, required this.length});
  int length;
  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  List<dynamic> _data = [];

  late Crud _crud;

  @override
  void initState() {
    super.initState();
    _crud = Crud();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<dynamic> dataList =
          await _crud.fetchData("$linkServerName/Donation_Request");
      setState(() {
        _data = dataList;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: widget.length ?? _data.length,
      itemBuilder: (context, i) {
        if (i < _data.length) {
          final data = _data[i];
          final hospitalCenter = data['hospitalCenter'];
          final bloodType = data['bloodType'];
          final dateFormat = DateFormat('MM/dd/yyyy');
          final date = dateFormat.format(dateFormat.parse(data['d']));

          return Padding(
            padding:
                const EdgeInsets.only(bottom: 15.0, left: 16.0, right: 16.0),
            child: Container(
              width: 363,
              height: 135.h,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Text(hospitalCenter,
                                    style: TextStyles.font14mainK7lysemiBold),
                                Text(date, style: TextStyles.font13GreyRegular),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          bloodType,
                          style: TextStyles.font22mainRedbold,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, right: 0),
                      child: AppTextButton(
                        textButton: "Donate Now",
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.donateBlood);
                        },
                        backgroundColor: ManagerColor.mainred,
                        buttonWidth: 300.w,
                        buttonHeight: 46.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
