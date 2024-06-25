import 'package:blood_life/core/helper/constants.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Informations extends StatefulWidget {
  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  List<bool> arrowDirections = [];

  @override
  void initState() {
    super.initState();
    arrowDirections = List<bool>.filled(questions.length, true);
  }

  void toggleArrowDirection(int index) {
    setState(() {
      arrowDirections[index] = !arrowDirections[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: questions.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${questions[i]['question']}',
                        style: TextStyles.font14mainK7lysemiBold),
                    GestureDetector(
                      onTap: () => toggleArrowDirection(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Matrix4.rotationZ(
                          arrowDirections[i] ? 0 : 1.57,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: ManagerColor.maink7ly,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (!arrowDirections[i])
                  Text('${questions[i]['answer']}',
                      style: TextStyles.font14GreyMedium),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  height: 10.h,
                  color: ManagerColor.maink7ly,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
