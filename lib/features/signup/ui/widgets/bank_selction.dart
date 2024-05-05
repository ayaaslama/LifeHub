import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';

class BankSelectionForm extends StatefulWidget {
  final Function(String?) onBankSelected;
  final String? initialBank;
  final TextEditingController bankController;
  BankSelectionForm(
      {required this.onBankSelected,
      this.initialBank,
      required this.bankController,
      required TextInputAction textInputAction,
      required FocusNode focusNode,
      required Null Function() onEditingComplete,
      required String? Function(dynamic value) validator});

  @override
  _BankSelectionFormState createState() => _BankSelectionFormState();
}

class _BankSelectionFormState extends State<BankSelectionForm> {
  String? selectedBank;
  List<String> banks = [
    'Cairo Bank',
    'Alexandria Bank',
    'Giza Bank',
    'Sharm El Sheikh Bank',
    'Luxor Bank',
    // Add more cities as needed
  ];
  /* @override
  void initState() {
    super.initState();
    selectedCity = widget.initialBank;
    widget.bankController = TextEditingController(text: selectedCity);
  }

  @override
  void dispose() {
    widget.bankController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      item: FieldItem(
        fieldName: 'Nearest Blood Bank',
        keyboardType: TextInputType.text,
        useSuffixIcon: true,
        suffixIcon: PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          itemBuilder: (BuildContext context) {
            return banks.map((String city) {
              return PopupMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList();
          },
          onSelected: (String? newValue) {
            setState(() {
              selectedBank = newValue;
              widget.bankController.text = newValue ?? '';
            });
            widget.onBankSelected(newValue);
          },
        ),
        myController: widget.bankController,
        onChanged: (value) {
          setState(() {
            selectedBank = value;
          });
          widget.onBankSelected(value);
        },
      ),
    );
  }
}
