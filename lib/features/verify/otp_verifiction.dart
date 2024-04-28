import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerifiction extends StatefulWidget {
  const OtpVerifiction({super.key});

  @override
  State<OtpVerifiction> createState() => _OtpVerifictionState();
}

class _OtpVerifictionState extends State<OtpVerifiction> {
  final _formKey = GlobalKey<FormState>();
  String userInput = '';
  final TextEditingController code = TextEditingController();
  Crud _crud = Crud();
  Future<void> _verify() async {
    var response = await _crud.postRequest(
      "$linkServerName/enter_token_verify?token=$userInput",
      ({
        "code": code.text,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 59),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OTP Verification',
                style: TextStyles.font24mainRedbold,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Add a PIN number to make your account\n more secure and easy to sign in.",
                style: TextStyles.font16GreyRegular,
              ),
              SizedBox(
                height: 15.h,
              ),
              Form(
                key: _formKey,
                child: MyTextField(
                    item: FieldItem(
                  fieldName: 'Code',
                  keyboardType: TextInputType.number,
                  myController: code,
                  onChanged: (value) {
                    setState(() {
                      userInput = value;
                    });
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400),
                child: AppTextButton(
                  textButton: "Submit",
                  buttonWidth: 327.w,
                  buttonHeight: 52.h,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _verify();
                    }
                    // if (
                    //   _formKey.currentState!.validate()
                    //   ) {
                    //   Navigator.pushNamed(context, '/home');
                    // }
                  },
                  formKey: _formKey,
                  backgroundColor: ManagerColor.mainred,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
