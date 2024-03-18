import 'package:blood_life/core/helper/feild_item.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(
              text: "Donate Register-Cont",
              iconColor: Colors.white,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Blood Register-Cont',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ManagerColor.maink7ly),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        item: FieldItem(
                            fieldName: 'Select Hospital-Center',
                            formKey: _formKey,
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
                            formKey: _formKey,
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
