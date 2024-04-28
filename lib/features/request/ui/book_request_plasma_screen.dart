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

class SearchPlasmaScreen extends StatefulWidget {
  const SearchPlasmaScreen({super.key});

  @override
  State<SearchPlasmaScreen> createState() => _BloodRegisterScreenState();
}

class _BloodRegisterScreenState extends State<SearchPlasmaScreen> {
  TextEditingController date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController selectHospital = TextEditingController();
  final TextEditingController selectDate = TextEditingController();
  final TextEditingController selectHoure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.plasmaColor,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          ' Plasma Register-Cont',
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
                                borderSideColor: ManagerColor.plasmaColor,
                                fieldName: 'Select Hospital-Center',
                                keyboardType: TextInputType.text,
                                useSuffixIcon: true,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/detalies.png',
                                      color: ManagerColor.plasmaColor,
                                    )),
                                myController: selectHospital,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            DateTextField(
                              borderSideColor: ManagerColor.plasmaColor,
                              labelText: 'Select Date',
                              icon: Icons.date_range_rounded,
                              iconColor: ManagerColor.plasmaColor,
                              onDateSelected: (selectedDate) {
                                print('Selected date: $selectedDate');
                              },
                              dateController: selectDate,
                              primaryColor: ManagerColor.plasmaColor,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              item: FieldItem(
                                borderSideColor: ManagerColor.plasmaColor,
                                fieldName: 'Select Hour',
                                keyboardType: TextInputType.text,
                                useSuffixIcon: true,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/detalies.png',
                                      color: ManagerColor.plasmaColor,
                                    )),
                                myController: selectHoure,
                              ),
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
                          backgroundColor: ManagerColor.plasmaColor,
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
