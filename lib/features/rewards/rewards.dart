import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _points = 0;

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
        final data =
            await crud.fetchData("$linkServerName/points?email=$storedEmail");
        setState(() {
          _points = data;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Points',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Congratulation..!',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30),
            child: SvgPicture.asset(
              'assets/svgs/gift.svg',
              height: 230.h,
              width: 233.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'You Have: ', style: TextStyles.font16GreysemiBold),
                TextSpan(
                    text: _points.toString(),
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: ManagerColor.maink7ly,
                        fontWeight: FontWeight.bold)),
                TextSpan(text: ' Points', style: TextStyles.font16GreysemiBold),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            child: Text(
              'Head to the nearest center to receive your gift!',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
