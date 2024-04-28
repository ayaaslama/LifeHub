import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/fonts_weight_helper.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/features/signup/ui/signup_screen.dart';
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
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List onboarding = [
    {
      'image': 'assets/svgs/onboarding.svg',
      'text1': 'Join our app ',
      'text2':
          "Join our app revolutionizing blood and plasma donation in Egypt",
      'text3': "",
      'text4': "NEXT",
    },
    {
      'image': 'assets/svgs/onboarding2.svg',
      'text1': 'Get points',
      'text2':
          " you can save the lives of one to three people, And  you can get points for it also ",
      'text3': "PREV",
      'text4': "NEXT",
    },
    {
      'image': 'assets/svgs/onboarding3.svg',
      'text1': 'Check your Health',
      'text2':
          "using AI to predict  if there is a possibility of contracting a specific disease",
      'text3': "PREV",
      'text4': "Get Standerd",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.8.h),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      controller: _controller,
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
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontsWeightHelper.semiBold,
                                    color: ManagerColor.maink7ly),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${onboarding[index]['text2']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyles.font14GreyMedium),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              SmoothPageIndicator(
                                  controller: _controller, // PageController
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: (currentIndex ==
                                                onboarding.length - 3)
                                            ? const Text('')
                                            : InkWell(
                                                onTap: () {
                                                  _controller.previousPage(
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
                                                          FontsWeightHelper
                                                              .medium,
                                                      color:
                                                          ManagerColor.mainred,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      Container(
                                          child: (currentIndex ==
                                                  onboarding.length - 1)
                                              ? AppTextButton(
                                                  textButton: 'Get Started',
                                                  onPressed: () {
                                                    context.pushNamed(
                                                        Routes.logIn);
                                                  },
                                                  buttonHeight: 49.h,
                                                  buttonWidth: 145.w,
                                                  borderRadius: 14,
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    _controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        curve: Curves.ease);
                                                  },
                                                  child: SizedBox(
                                                    height: 24,
                                                    width: 53,
                                                    child: Text(
                                                      onboarding[index]
                                                          ['text4'],
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontsWeightHelper
                                                                .medium,
                                                        color: ManagerColor
                                                            .mainred,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                    ]),
                              ),
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
          )),
    );
  }
}
