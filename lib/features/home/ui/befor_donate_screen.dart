import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 165, 6, 6),
        title: const Text(
          'Before you donate',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/befordonate.png',
                height: 174,
                width: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Before you donate',
                textAlign: TextAlign.center,
                style: TextStyles.font20K7lybold,
              ),
            ),
            SizedBox(
              height: 265,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Ensure you meet eligibility criteria, \nincluding age, weight, and overall \nhealth.',
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      '2. Eat a nutritious meal, including\niron-rich foods, and stay well-\nhydrated.',
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      "3. Get a good night's sleep before \ndonating.",
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    )
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: SizedBox(
                height: 72,
                width: 400,
                child: Text(
                  '        Always consult with medical \nprofessionals for personalized advice \n     based on your health condition.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.3),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
