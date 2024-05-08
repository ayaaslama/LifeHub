import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/login/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  String _userName = '';
  String _email = '';
  String _phone = '';
  String _bloodBank = '';
  String _gender = '';
  String _nationalID = '';

  final secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Crud _crud = Crud();

  Future<void> fetchData() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        final data = await _crud
            .fetchData("$linkServerName/personal?Email=$storedEmail");
        setState(() {
          _userName = data['userName'];
          _email = data['email'];
          _phone = data['phone'];
          _bloodBank = data['bloodBank'];
          _gender = data['gender'];
          _nationalID = data['nationalID'];
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
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _userName,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _email,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _phone,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _bloodBank,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _gender,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            _nationalID,
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(height: 10.h),
        Divider(height: 10.h),
      ],
    );
  }
}
