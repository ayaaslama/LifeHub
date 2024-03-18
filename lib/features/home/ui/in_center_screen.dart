import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InCenter extends StatelessWidget {
  const InCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(234, 68, 68, 1),
        title: Text(
          "In-Hospital",
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 60, left: 10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Rectangle 6659 (1).png',
                height: 172,
                width: 400,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'In-Hospital',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 23,
                    letterSpacing: -0.3),
              ),
            ),
            Container(
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "1. Follow the guidelines provided by \nthe hospital staff",
                        style: GoogleFonts.inriaSans(
                          textStyle: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        )),
                    Text(
                      '2. Inform them of any discomfort or \nunusual symptoms post-donation',
                      style: GoogleFonts.inriaSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 23,
                          letterSpacing: -0.3),
                    ),
                    Text(
                        "3. Take adequate rest and allow your \nbody time to recover",
                        style: GoogleFonts.inriaSans(
                          textStyle: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        )),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 50,
                width: 400,
                child: Text(
                  '        Always consult with medical \nprofessionals for personalized advice \nbased on your health condition.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: const Color.fromRGBO(128, 128, 128, 1),
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
