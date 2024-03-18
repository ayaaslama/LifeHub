import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/home/ui/widgets/blood_plasma_contaner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateBlood extends StatefulWidget {
  const DonateBlood({super.key});

  @override
  State<DonateBlood> createState() => _DonateBloodState();
}

class _DonateBloodState extends State<DonateBlood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeAppBar(
            color: ManagerColor.mainred,
            text: 'Select Donation -Type',
            iconColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Congratulations!',
                  style: TextStyles.font24K7lyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    'You are eligible to donate, Please\nchoose one of the donation types below',
                    style: TextStyles.font16GreysemiBold),
                const SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 10.h,
                ),
                const CustomeBloodPlasma(),
                const SizedBox(
                  height: 5.0,
                ),
                Divider(
                  height: 10.h,
                ),
                CustomeBloodPlasma(
                  onpressed1: () =>
                      {Navigator.pushNamed(context, '/book_plasma')},
                  text1: 'Allow 1.5 hours for your visit ',
                  text2: 'Plasma',
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
