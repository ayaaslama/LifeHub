import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.item}) : super(key: key);
  final FieldItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        obscureText: item.obscureText,
        controller: item.myController,
        onChanged: item.onChanged,
        onSaved: item.onSave,
        onFieldSubmitted: item.onSubmitted,
        validator: item.validator,
        enabled: item.enable,
        focusNode: item.focusNode,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 1.3,
              style: BorderStyle.solid,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              width: 1.3,
              style: BorderStyle.solid,
              color: item.borderSideColor ?? ManagerColor.mainred,
            ),
          ),
          hintText: item.fieldName,
          prefixIcon: item.useicon ? Icon(item.icon) : null,
          suffixIcon: item.useSuffixIcon ? item.suffixIcon : null,
          fillColor: const Color(0XFFFDFDFF),
          filled: true,
        ),
        style: TextStyles.font14mainK7lyMedium,
        keyboardType: item.keyboardType,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return '${item.fieldName} is required';
        //   }
        //   if (item.fieldName == 'Password') {
        //     if (value.length < 8) {
        //       return 'Password must be at least 8 characters';
        //     }
        //   }

        //   if (item.fieldName == 'Email') {
        //     if (!value.contains('@')) {
        //       return 'Invalid email address';
        //     }
        //   }

        //   if (item.fieldName == 'Phone Number') {
        //     if (value.length != 11) {
        //       return 'Invalid phone number';
        //     }
        //   }
        //   if (item.fieldName == 'National ID') {
        //     if (value.length != 14) {
        //       return 'Invalid National ID';
        //     }
        //   }
        //   return null;
        // },
      ),
    );
  }
}
