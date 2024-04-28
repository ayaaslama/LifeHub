import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/home/ui/widgets/blood_plasma_contaner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() => _DonateBloodState();
}

class _DonateBloodState extends State<RequestBloodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Select Request -Type',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What type you need to request?',
                  style: TextStyles.font20K7lybold,
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 10.h,
                ),
                CustomeBloodPlasma(
                    text3: 'Search Now',
                    onpressed1: () =>
                        context.pushReplacementNamed(Routes.searchBloodScreen)),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 10.h,
                ),
                CustomeBloodPlasma(
                  onpressed1: () =>
                      context.pushReplacementNamed(Routes.searchPlasmaScreen),
                  text1: 'Allow 1.5 hours for your visit ',
                  text2: 'Plasma',
                  text3: 'Search Now',
                  assetName: 'assets/svgs/plasma.svg',
                  width: 10,
                  color: const Color.fromRGBO(255, 183, 66, 1),
                  color1: const Color.fromRGBO(255, 183, 66, 1),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
