import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/vaildator/validator.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/core/widgets/loading.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
import 'package:blood_life/features/donate/logic/cubit/donateplasma_cubit.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonatePlasmaScreen extends StatefulWidget {
  const DonatePlasmaScreen({super.key});

  @override
  State<DonatePlasmaScreen> createState() => _BloodRegisterScreenState();
}

class _BloodRegisterScreenState extends State<DonatePlasmaScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final idFocusNode = FocusNode();
  final hospitalCenterFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final hourFocusNode = FocusNode();

  String? id, hour;

  final TextEditingController hospitalCenter = TextEditingController();
  final TextEditingController date = TextEditingController();
  String? selectedCenter;
  List<String> center = [
    'Cairo Center',
    'Alexandria Center',
    'Giza Center',
    'Sharm El Sheikh Center',
    'Luxor Center',
    // Add more cities as needed
  ];

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
            context.pushReplacementNamed(Routes.donateBlood);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<DonateplasmaCubit, DonateplasmaState>(
        listener: (context, state) {
          if (state is DonatePlasmaLoading) {
            isLoading = true;
          } else if (state is DonatePlasmaSuccesse) {
            isLoading = false;
            context.pushNamed(Routes.myNavigationBar);
          } else if (state is DonatePlasmaFailure) {
            showSnackBar("You can't donte now,check your Last donation",
                ManagerColor.mainred);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                            key: formKey,
                            child: Column(
                              children: [
                                MyTextField(
                                  item: FieldItem(
                                    fieldName: 'National ID',
                                    borderSideColor: ManagerColor.plasmaColor,
                                    useSuffixIcon: true,
                                    onSave: (data) {
                                      id = data;
                                    },
                                    validator: (value) {
                                      return Validator.validateAnotherField(
                                          value);
                                    },
                                    focusNode: idFocusNode,
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () {
                                      FocusScope.of(context).requestFocus(
                                          hospitalCenterFocusNode);
                                    },
                                  ),
                                ),
                                MyTextField(
                                  item: FieldItem(
                                      borderSideColor: ManagerColor.plasmaColor,
                                      fieldName: 'Select Hospital-Center',
                                      validator: (value) {
                                        return Validator.validateAnotherField(
                                            value);
                                      },
                                      focusNode: hospitalCenterFocusNode,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(dateFocusNode);
                                      },
                                      useSuffixIcon: true,
                                      suffixIcon: PopupMenuButton<String>(
                                        icon: Image.asset(
                                          'assets/images/detalies.png',
                                          color: ManagerColor.plasmaColor,
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
                                            hospitalCenter.text =
                                                newValue ?? '';
                                          });
                                        },
                                      ),
                                      myController: hospitalCenter),
                                ),
                                DateTextField(
                                  borderSideColor: ManagerColor.plasmaColor,
                                  labelText: 'Select Date',
                                  validator: (value) {
                                    return Validator.validateAnotherField(
                                        value);
                                  },
                                  focusNode: dateFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context)
                                        .requestFocus(hourFocusNode);
                                  },
                                  icon: Icons.date_range_rounded,
                                  iconColor: ManagerColor.plasmaColor,
                                  onDateSelected: (selectedDate) {
                                    print('Selected date: $selectedDate');
                                  },
                                  primaryColor: ManagerColor.plasmaColor,
                                  dateController: date,
                                ),
                                MyTextField(
                                  item: FieldItem(
                                    borderSideColor: ManagerColor.plasmaColor,
                                    fieldName: 'Hour',
                                    keyboardType: TextInputType.text,
                                    useSuffixIcon: true,
                                    onSave: (data) {
                                      hour = data;
                                    },
                                    validator: (value) {
                                      return Validator.validateAnotherField(
                                          value);
                                    },
                                    focusNode: hourFocusNode,
                                    textInputAction: TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: isLoading
                                ? const LoadingButton(
                                    color: ManagerColor.plasmaColor,
                                  )
                                : AppTextButton(
                                    textButton: 'Book',
                                    buttonWidth: 300,
                                    backgroundColor: ManagerColor.plasmaColor,
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();

                                        BlocProvider.of<DonateplasmaCubit>(
                                                context)
                                            .register(
                                                id: id!,
                                                hospitalCenter:
                                                    hospitalCenter.text,
                                                date: date.text,
                                                hour: hour!);
                                      }
                                    },
                                  ),
                          )
                        ])),
              ],
            ),
          );
        },
      ),
    );
  }
}
