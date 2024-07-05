import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen>
    with SingleTickerProviderStateMixin {
  int _points = 0;
  final maxPoints = 1000;

  final secureStorage = const FlutterSecureStorage();
  late Crud crud;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    crud = Crud();
    fetchData();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        final data =
            await crud.fetchData("$linkServerName/points?email=$storedEmail");
        setState(() {
          _points = data ?? 0;
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
    double percentage = (_points / maxPoints) * 100;
    Color progressColor =
        percentage < 100 ? ManagerColor.mainred : Colors.green;

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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              'Congratulations!',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
          SizedBox(height: 30.h),
          SvgPicture.asset(
            'assets/svgs/gift.svg',
            height: 230.h,
            width: 233.w,
          ),
          SizedBox(height: 40.h),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: percentage / 100),
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 12.0,
                percent: value,
                center: Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                progressColor: progressColor,
              );
            },
          ),
          SizedBox(height: 10.h),
          Text(
            '${_points} Points',
            style: TextStyles.font16GreysemiBold,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Head to the nearest center to receive your gift!',
              style: TextStyles.font16GreysemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
