import 'package:blood_life/core/helper/constants.dart';
import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/fonts_weight_helper.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              Expanded(
                flex: 100,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: onboarding.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 161),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: SvgPicture.asset(
                              '${onboarding[index]['image']}',
                              height: 200.h,
                              width: 300.w,
                            )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${onboarding[index]['text1']}',
                              textAlign: TextAlign.center,
                              style: TextStyles.font22K7lybold,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${onboarding[index]['text2']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.font14GreyMedium),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SmoothPageIndicator(
                                controller: controller, // PageController
                                count: onboarding.length,
                                effect: const WormEffect(
                                    dotColor: Colors.grey,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    paintStyle: PaintingStyle.fill,
                                    activeDotColor: ManagerColor
                                        .mainred), // your preferred effect
                                onDotClicked: (index) {}),
                            const SizedBox(
                              height: 35.0,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: (currentIndex ==
                                            onboarding.length - 3)
                                        ? const Text('')
                                        : InkWell(
                                            onTap: () {
                                              controller.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease);
                                            },
                                            child: SizedBox(
                                              height: 24.h,
                                              width: 53.w,
                                              child: Text(
                                                onboarding[index]['text3'],
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontsWeightHelper.medium,
                                                  color: ManagerColor.mainred,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                  Container(
                                      child: (currentIndex ==
                                              onboarding.length - 1)
                                          ? isLoading
                                              ? LoadingButton(
                                                  height: 49.h,
                                                  width: 145.h,
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                )
                                              : AppTextButton(
                                                  textButton: 'Get Started',
                                                  onPressed: () async {
                                                    if (isLoading) return;
                                                    setState(
                                                        () => isLoading = true);
                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    setState(() =>
                                                        isLoading = false);

                                                    context.pushNamed(
                                                        Routes.logIn);
                                                  },
                                                  buttonHeight: 49.h,
                                                  buttonWidth: 145.w,
                                                  borderRadius: 14,
                                                )
                                          : InkWell(
                                              onTap: () {
                                                controller.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease);
                                              },
                                              child: SizedBox(
                                                height: 24,
                                                width: 53,
                                                child: Text(
                                                  onboarding[index]['text4'],
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontsWeightHelper
                                                            .medium,
                                                    color: ManagerColor.mainred,
                                                  ),
                                                ),
                                              ),
                                            )),
                                ]),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
