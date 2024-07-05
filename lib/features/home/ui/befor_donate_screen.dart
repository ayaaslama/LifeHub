import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeforDonate extends StatefulWidget {
  const BeforDonate({super.key});

  @override
  State<BeforDonate> createState() => _BeforDonateState();
}

class _BeforDonateState extends State<BeforDonate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
        elevation: 0,
        backgroundColor: ManagerColor.white,
        title: Text(
          'Befor you donate',
          style: TextStyle(
            color: ManagerColor.maink7ly,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Drink plenty of fluids in the 24 hours before. 8 glasses for women and 10 for men.",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/drink.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Eat something savoury and drink 750ml (3 good-sized glasses) of fluids in the 3 hours before.",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/eat.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Avoid exercise or strenuous activities in the 3 hours before.",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/fitness.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            AppTextButton(
              textButton: 'OK, Understood It',
              onPressed: () {
                context.pushReplacementNamed(Routes.myNavigationBar);
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
