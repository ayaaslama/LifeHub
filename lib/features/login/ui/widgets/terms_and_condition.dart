import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';

class TermAndConditionText extends StatelessWidget {
  const TermAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13GreyRegular),
        TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font14DarkBlackMedium),
        TextSpan(
            text: 'and ',
            style: TextStyles.font13GreyRegular.copyWith(height: 1.5)),
        TextSpan(
            text: 'PrivacyPolicy', style: TextStyles.font14DarkBlackMedium),
      ]),
    );
  }
}
