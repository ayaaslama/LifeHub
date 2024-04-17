import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailForVerify extends StatefulWidget {
  const EmailForVerify({super.key});

  @override
  State<EmailForVerify> createState() => _EmailForVerifyState();
}

class _EmailForVerifyState extends State<EmailForVerify> {
  final _formKey = GlobalKey<FormState>();
  String userInput = '';
  final TextEditingController email = TextEditingController();
  Crud _crud = Crud();
  Future<void> _verify() async {
    var response = await _crud.postRequest(
        "$linkServerName/send_verify_token?email=$userInput",
        ({
          "email": email.text,
        }), (bool success) {
      if (success) {
        print("Authentication successfully");
        Navigator.pushNamed(context, '/otp_verifiction');
      } else {
        print("Authentication Fail");
      }
    });
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
                'Email',
                style: TextStyles.font24mainRedbold,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Add a email to send your code\n for secure and easy to sign in.",
                style: TextStyles.font16GreyRegular,
              ),
              SizedBox(
                height: 15.h,
              ),
              Form(
                key: _formKey,
                child: MyTextField(
                    item: FieldItem(
                  fieldName: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  myController: email,
                  onChanged: (value) {
                    setState(() {
                      userInput = value;
                    });
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 480),
                child: AppTextButton(
                  textButton: "Reset Code",
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
