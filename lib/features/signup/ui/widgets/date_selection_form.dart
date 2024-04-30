import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final Color? borderSideColor;
  final Function(DateTime?) onDateSelected;
  final Color? primaryColor;
  final TextEditingController dateController;
  final Color? iconColor;
  final void Function(String?)? onsave;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const DateTextField(
      {Key? key,
      required this.labelText,
      required this.icon,
      required this.onDateSelected,
      this.borderSideColor,
      this.primaryColor,
      required this.dateController,
      this.iconColor,
      this.onsave,
      this.onEditingComplete,
      this.validator,
      this.focusNode,
      this.textInputAction})
      : super(key: key);

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  DateTime? selectedDate;
  //Color? primaryColor;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: widget.primaryColor ?? ManagerColor.mainred,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  //primary: const Color(0xFFEA4444),
                  ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.dateController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
      widget.onDateSelected(selectedDate);
    }
  }

  @override
  void dispose() {
    widget.dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      item: FieldItem(
        myController: widget.dateController,
        fieldName: widget.labelText,
        onSave: widget.onsave,
        onEditingComplete: widget.onEditingComplete,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        validator: widget.validator,
        useicon: false,
        useSuffixIcon: true,
        suffixIcon: IconButton(
          icon: Icon(widget.icon,
              color: widget.iconColor ?? ManagerColor.mainred),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }
}
