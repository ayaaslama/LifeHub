import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBloodScreen extends StatefulWidget {
  const SearchBloodScreen({super.key});

  @override
  State<SearchBloodScreen> createState() => _BloodRegisterScreenState();
}

class _BloodRegisterScreenState extends State<SearchBloodScreen> {
  TextEditingController date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController selectHospital = TextEditingController();
  final TextEditingController selectDate = TextEditingController();
  final TextEditingController selectHoure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
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
            context.pushReplacementNamed(Routes.bloodRequset);
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
                                  fieldName: 'Select Hospital-Center',
                                  useSuffixIcon: true,
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/detalies.png',
                                        color: ManagerColor.mainred,
                                      )),
                                  myController: selectHospital),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            DateTextField(
                              labelText: 'Date Of Birth',
                              icon: Icons.date_range,
                              onDateSelected: (selectedDate) {
                                // Handle the selected date
                                print('Selected date: $selectedDate');
                              },
                              dateController: selectDate,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'Select Hour',
                                  useSuffixIcon: true,
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/detalies.png',
                                        color: ManagerColor.mainred,
                                      )),
                                  myController: selectHoure),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: AppTextButton(
                          textButton: 'Book',
                          buttonWidth: 300,
                          backgroundColor: ManagerColor.mainred,
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
