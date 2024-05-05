import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';

class DonatingWhatToExcept extends StatelessWidget {
  const DonatingWhatToExcept({super.key});

  @override
  Widget build(BuildContext context) {
    container(img, txt, double w, double h, c1, c2, void Function()? onTap) {
      return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: c1,
          border: Border.all(
            color: c2,
            width: 1,
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img, // Replace with your image file path
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(txt, style: TextStyles.font16K7lybold),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
        child:
            Text("Donating -What to expect", style: TextStyles.font16K7lybold),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          container(
              "assets/images/Rectangle 6654.png",
              "Before",
              93,
              123,
              const Color.fromRGBO(255, 107, 107, 0.16),
              Colors.white,
              () => context.pushNamed(Routes.beforDonate)),
          container(
              "assets/images/Rectangle 6656.png",
              "In-Center",
              93,
              123,
              const Color.fromRGBO(0, 179, 255, 0.15),
              Colors.white,
              () => context.pushNamed(Routes.inCenter)),
          container(
              "assets/images/Rectangle 6658.png",
              "After",
              93,
              123,
              const Color.fromRGBO(255, 182, 64, 0.21),
              Colors.white,
              () => context.pushNamed(Routes.afterDonate)),
        ],
      ),
    ]));
  }
}
