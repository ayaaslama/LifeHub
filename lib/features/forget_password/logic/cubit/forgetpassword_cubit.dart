import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  static ForgetpasswordCubit of(context) => BlocProvider.of(context);
}
