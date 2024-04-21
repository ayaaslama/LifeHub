import 'package:blood_life/core/theaming/color.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String value;
  final String label;
  final double left;
  final TextStyle style;
  final Color? activeColor;
  final Function(String, bool) onGenderChanged;
  CheckBox({
    required this.value,
    required this.label,
    required this.style,
    required this.left,
    required this.onGenderChanged,
    this.activeColor,
  });

  @override
  _CustomColorCheckBoxState createState() => _CustomColorCheckBoxState();
}

class _CustomColorCheckBoxState extends State<CheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(widget.label, style: widget.style),
          Padding(
            padding: EdgeInsets.only(left: widget.left),
            child: Checkbox(
              value: _isChecked,
              onChanged: (bool? value) async {
                setState(() {
                  _isChecked = value!;
                });
                widget.onGenderChanged(widget.value, _isChecked);
              },
              activeColor: widget.activeColor ?? ManagerColor.mainred,
              focusColor: ManagerColor.maink7ly,
            ),
          ),
        ],
      ),
    );
  }
}
