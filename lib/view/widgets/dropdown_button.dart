import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  DropDownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String dropdownValue = 'Choose data';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? newValue) {
        dropdownValue = newValue!;
      },
      
      items: <String>['Choose data', 'Today, 19:00 — 21:00']
          .map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
