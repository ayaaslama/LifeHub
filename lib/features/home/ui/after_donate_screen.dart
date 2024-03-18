import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterDonate extends StatelessWidget {
  const AfterDonate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ManagerColor.mainred,
        title: const Text(
          "After you donate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Rectangle 6659 (2).png',
                height: 174,
                width: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'After you donate',
                textAlign: TextAlign.center,
                style: TextStyles.font20K7lybold,
              ),
            ),
            SizedBox(
              height: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Rest for a few minutes and have a \nsnack provided by the blood donation \ncenter.',
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      '2. Drink plenty of fluids to stay \nhydrated.',
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      "3. Avoid heavy lifting or strenuous \nactivities for the rest of the day.",
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      "4. Eat a healthy meal with iron-rich \nfoods to replenish your energy.",
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 80.h,
                width: 400.w,
                child: const Text(
                  '  Always consult with medical \nprofessionals for personalized advice \n     based on your health condition.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      letterSpacing: -0.3),
                ),
              ),
            ),
            AppTextButton(
              textButton: "OK, Understand it",
              buttonWidth: 281.w,
              backgroundColor: const Color.fromRGBO(116, 218, 127, 1),
              onPressed: () => {
                Navigator.pushNamed(context, '/home'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
