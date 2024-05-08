import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookBloodScreen extends StatefulWidget {
  const BookBloodScreen({super.key});

  @override
  State<BookBloodScreen> createState() => _BloodRegisterScreenState();
}

class _BloodRegisterScreenState extends State<BookBloodScreen> {
  final _formKey = GlobalKey<FormState>();
  Crud _crud = Crud();

  final TextEditingController id = TextEditingController();
  final TextEditingController hospitalCenter = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController hour = TextEditingController();
  String? selectedCenter;
  List<String> center = [
    'Cairo Center',
    'Alexandria Center',
    'Giza Center',
    'Sharm El Sheikh Center',
    'Luxor Center',
    // Add more cities as needed
  ];

  Future<void> _register() async {
    var response = await _crud.postRequest(
        "$linkServerName/blood_register",
        ({
          "id": id.text,
          "hospitalCenter": hospitalCenter.text,
          "date": date.text,
          "hour": hour.text,
        }), (bool success) {
      if (success && _formKey.currentState!.validate()) {
        print("User Registered successfully");
      } else {
        print("Register Fail");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        centerTitle: true,
        title: Text(
          'Donate Register-Cont',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.donateBlood);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Blood Register-Cont',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: ManagerColor.maink7ly),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'National ID',
                                  useSuffixIcon: true,
                                  myController: id),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'Select Hospital-Center',
                                  useSuffixIcon: true,
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: Image.asset(
                                      'assets/images/detalies.png',
                                      color: ManagerColor.mainred,
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return center.map((String center) {
                                        return PopupMenuItem<String>(
                                          value: center,
                                          child: Text(center),
                                        );
                                      }).toList();
                                    },
                                    onSelected: (String? newValue) {
                                      setState(() {
                                        selectedCenter = newValue;
                                        hospitalCenter.text = newValue ?? '';
                                      });
                                    },
                                  ),
                                  myController: hospitalCenter),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            DateTextField(
                              borderSideColor: ManagerColor.mainred,
                              labelText: 'Select Date',
                              icon: Icons.date_range_rounded,
                              iconColor: ManagerColor.mainred,
                              onDateSelected: (selectedDate) {
                                print('Selected date: $selectedDate');
                              },
                              dateController: date,
                              primaryColor: ManagerColor.mainred,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              item: FieldItem(
                                borderSideColor: ManagerColor.mainred,
                                fieldName: 'Hour',
                                keyboardType: TextInputType.text,
                                useSuffixIcon: true,
                                myController: hour,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: AppTextButton(
                            textButton: 'Book',
                            buttonWidth: 300,
                            backgroundColor: ManagerColor.mainred,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _register();
                              }
                            }),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
