import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';

class CitySelectionForm extends StatefulWidget {
  final Function(String?) onCitySelected;
  final String? initialCity;
  final TextEditingController cityController;
  final void Function(String?)? onsave;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  CitySelectionForm(
      {required this.onCitySelected,
      this.initialCity,
      required this.cityController,
      this.onsave,
      this.onEditingComplete,
      this.focusNode,
      this.validator,
      this.textInputAction});

  @override
  _CitySelectionFormState createState() => _CitySelectionFormState();
}

class _CitySelectionFormState extends State<CitySelectionForm> {
  String? selectedCity;
  List<String> cities = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Sharm El Sheikh',
    'Luxor',
    // Add more cities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      item: FieldItem(
        fieldName: 'City',
        keyboardType: TextInputType.text,
        useSuffixIcon: true,
        suffixIcon: PopupMenuButton<String>(
          icon: Icon(Icons.arrow_drop_down),
          itemBuilder: (BuildContext context) {
            return cities.map((String city) {
              return PopupMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList();
          },
          onSelected: (String? newValue) {
            setState(() {
              selectedCity = newValue;
              widget.cityController.text = newValue ?? '';
            });
            widget.onCitySelected(newValue);
          },
        ),
        onSave: widget.onsave,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        myController: widget.cityController,
        focusNode: widget.focusNode,
        validator: widget.validator,
        onChanged: (value) {
          setState(() {
            selectedCity = value;
          });
          widget.onCitySelected(value);
        },
      ),
    );
  }
}
