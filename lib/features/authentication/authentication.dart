import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  String userInput = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  // Crud _crud = Crud();

  // Future<void> _authentication() async {
  //   var response = await _crud.postRequest(
  //       "https://3a51-156-203-190-131.ngrok-free.app/api/Users/send_verify_token?email=$userInput",
  //       ({
  //         "email": email.text,
  //       }), (bool success) {
  //     if (success) {
  //       print("User verify successfully");
  //       Navigator.pushNamed(context, '/verify');
  //     } else {
  //       print("verify Fail");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset("assets/images/logo.png"),
                ),
                const Text(
                  "Health Hub",
                  style: TextStyle(
                    color: Color.fromRGBO(234, 68, 68, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter your email to send code for reset password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: MyTextField(
                    item: FieldItem(
                      fieldName: 'Email',
                      useicon: true,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      myController: email,
                      onChanged: (value) {
                        setState(() {
                          userInput = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: AppTextButton(
                    textButton: "LOG IN",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/verify');
                        //_authentication();
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                AppTextButton(
                  textButton: "Back to log in",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
