import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/vaildator/validator.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/core/widgets/loading.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
import 'package:blood_life/features/additional_service/logic/cubit/bloodfilteration_cubit.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodFiltration extends StatefulWidget {
  const BloodFiltration({super.key});

  @override
  State<BloodFiltration> createState() => _BloodFiltrationState();
}

class _BloodFiltrationState extends State<BloodFiltration> {
  final formKey = GlobalKey<FormState>();
  final typeOfTestFocusNode = FocusNode();
  final bloodTypeFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final iDcardFocusNode = FocusNode();
  final hospitalCenterFocusNode = FocusNode();
  bool isLoading = false;

  final TextEditingController hospitalCenter = TextEditingController();
  final TextEditingController typeOfTest = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController iDcard = TextEditingController();
  String? selectedCenter, selectedTest, selectedType;

  List<String> center = [
    'Cairo Center',
    'Alexandria Center',
    'Giza Center',
    'Shubra El-Kheima Center',
    'Port Said Center',
    'Suez Center',
    'Luxor Center',
    'Mansoura Center',
    'El-Mahalla El-Kubra Center',
    'Tanta Center',
    'Asyut Center',
  ];
  List<String> bloodFiltration = [
    'Hemodialysis',
    'Peritoneal dialysis',
    'Plasma exchange (Plasmapheresis)',
    'Continuous renal replacement therapy (CRRT)',
    'Liver dialysis (MARS, Prometheus)',
    'White blood cell filtration (Leukapheresis)',
    'Red blood cell filtration (Erythrocytapheresis)',
    'Platelet filtration (Thrombocytapheresis)'
  ];
  List<String> type = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        centerTitle: true,
        title: Text(
          'Blood  Fitration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.additionalService);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<BloodfilterationCubit, BloodfilterationState>(
        listener: (context, state) {
          if (state is BloodfilterationLoading) {
            isLoading = true;
          } else if (state is BloodfilterationSuccesse) {
            isLoading = false;
            context.pushNamed(Routes.myNavigationBar);
          } else if (state is BloodfilterationFailure) {
            showSnackBar("Processe not successe", ManagerColor.mainred);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Blood  Fitration ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ManagerColor.maink7ly),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'Select Hospital-Center',
                                  validator: (value) {
                                    return Validator.validateAnotherField(
                                        value);
                                  },
                                  focusNode: hospitalCenterFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context)
                                        .requestFocus(typeOfTestFocusNode);
                                  },
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
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'Type of Filteration ',
                                  validator: (value) {
                                    return Validator.validateAnotherField(
                                        value);
                                  },
                                  focusNode: typeOfTestFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context)
                                        .requestFocus(bloodTypeFocusNode);
                                  },
                                  useSuffixIcon: true,
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: Image.asset(
                                      'assets/images/detalies.png',
                                      color: ManagerColor.mainred,
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return bloodFiltration.map((String test) {
                                        return PopupMenuItem<String>(
                                          value: test,
                                          child: Text(test),
                                        );
                                      }).toList();
                                    },
                                    onSelected: (String? newValue) {
                                      setState(() {
                                        selectedTest = newValue;
                                        typeOfTest.text = newValue ?? '';
                                      });
                                    },
                                  ),
                                  myController: typeOfTest),
                            ),
                            DateTextField(
                              validator: (value) {
                                return Validator.validateAnotherField(value);
                              },
                              focusNode: dateFocusNode,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(bloodTypeFocusNode);
                              },
                              labelText: 'when you need it',
                              icon: Icons.date_range,
                              onDateSelected: (selectedDate) {
                                print('Selected date: $selectedDate');
                              },
                              dateController: date,
                            ),
                            MyTextField(
                              item: FieldItem(
                                  fieldName: 'Select blood-Type',
                                  validator: (value) {
                                    return Validator.validateAnotherField(
                                        value);
                                  },
                                  focusNode: bloodTypeFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context)
                                        .requestFocus(iDcardFocusNode);
                                  },
                                  useSuffixIcon: true,
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: Image.asset(
                                      'assets/images/detalies.png',
                                      color: ManagerColor.mainred,
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return type.map((String type) {
                                        return PopupMenuItem<String>(
                                          value: type,
                                          child: Text(type),
                                        );
                                      }).toList();
                                    },
                                    onSelected: (String? newValue) {
                                      setState(() {
                                        selectedType = newValue;
                                        bloodType.text = newValue ?? '';
                                      });
                                    },
                                  ),
                                  myController: bloodType),
                            ),
                            MyTextField(
                              item: FieldItem(
                                  validator: (value) {
                                    return Validator.validateAnotherField(
                                        value);
                                  },
                                  focusNode: iDcardFocusNode,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  fieldName: 'National ID',
                                  myController: iDcard),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: isLoading
                            ? const LoadingButton()
                            : AppTextButton(
                                textButton: 'Book',
                                buttonWidth: 300,
                                backgroundColor: ManagerColor.mainred,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    BlocProvider.of<BloodfilterationCubit>(
                                            context)
                                        .bloodFiltration(
                                            hospitalCenter: hospitalCenter.text,
                                            typeOfTest: typeOfTest.text,
                                            date: date.text,
                                            bloodType: bloodType.text,
                                            iDcard: iDcard.text);
                                  }
                                },
                              ),
                      )
                    ])),
          );
        },
      ),
    );
  }
}
