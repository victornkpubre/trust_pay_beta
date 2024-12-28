
import 'package:flutter/material.dart';

class AppDropDownInput extends StatefulWidget {
  final String title;
  final String initialValue;
  final List<String> items;
  const AppDropDownInput({super.key, required this.items, required this.title, required this.initialValue});

  @override
  State<AppDropDownInput> createState() => _AppDropDownInputState();
}

class _AppDropDownInputState extends State<AppDropDownInput> {
  String? _dropdownvalue;

  String? get dropdownvalue => _dropdownvalue;

  set dropdownvalue(String? value) {
    _dropdownvalue = value;
  }

  
  @override
  Widget build(BuildContext context) {

    return DropdownButton(       
      icon: const Icon(Icons.keyboard_arrow_down),     
      items: widget.items.map((String items) { 
        return DropdownMenuItem( 
          value: items, 
          child: Text(items), 
        ); 
      }).toList(), 
      onChanged: (String? newValue) {  
        setState(() { 
          dropdownvalue = newValue!; 
        }); 
      }, 
    );
  }
}