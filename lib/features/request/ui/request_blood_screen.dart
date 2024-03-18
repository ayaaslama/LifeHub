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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeAppBar(
            color: ManagerColor.mainred,
            text: 'Select Request -Type',
            iconColor: Colors.white,
          ),
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
                      {Navigator.pushNamed(context, '/blood_search')},
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 10.h,
                ),
                CustomeBloodPlasma(
                  onpressed1: () =>
                      {Navigator.pushNamed(context, '/plasma_search')},
                  text1: 'Allow 1.5 hours for your visit ',
                  text2: 'Plasma',
                  text3: 'Search Now',
                  assetName: 'assets/svgs/plasma.svg',
                  width: 10,
                  color: const Color.fromRGBO(255, 183, 66, 1),
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
