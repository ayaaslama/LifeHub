import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MedicalInfoWidget extends StatefulWidget {
  const MedicalInfoWidget({super.key});

  @override
  State<MedicalInfoWidget> createState() => _MedicalInfoWidgetState();
}

class _MedicalInfoWidgetState extends State<MedicalInfoWidget> {
  int _bloodCount = 0;
  int _plasmaCount = 0;
  int _sum = 0;
  String _bloodType = '';
  String _dateOfDonate = '';

  final secureStorage = const FlutterSecureStorage();
  late Crud _crud;

  @override
  void initState() {
    super.initState();
    _crud = Crud();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        final data =
            await _crud.fetchData("$linkServerName/medical?email=$storedEmail");
        setState(() {
          _bloodCount = data['blood_count'];
          _plasmaCount = data['plasma_count'];
          _sum = data['sum'];
          _bloodType = data['bloodType'];
          _dateOfDonate = data['dateOfDonate'];
        });
        print('Fetched data successfully');
      } else {
        print('No stored email found');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Blood Type',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                _bloodType,
                style: TextStyles.font20mainredsemiBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total number of Donate',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                _sum.toString(),
                style: TextStyles.font20mainredsemiBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Donate Blood',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                _bloodCount.toString(),
                style: TextStyles.font20mainredsemiBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Donate plasma ',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                _plasmaCount.toString(),
                style: TextStyles.font20mainredsemiBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Date Of Donation',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                _dateOfDonate,
                style: TextStyles.font20mainredsemiBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
      ],
    );
  }
}
