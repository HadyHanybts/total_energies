import 'package:flutter/material.dart';

class CustDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final List<String> options; // Custom options list
  final String? Function(String?) validator;

  const CustDropdown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.options, // Accepts options as a parameter
    required this.validator,
  });

  @override
  _CustDropdownState createState() => _CustDropdownState();
}

class _CustDropdownState extends State<CustDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          menuMaxHeight: 200,
          value:
              widget.controller.text.isNotEmpty ? widget.controller.text : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: widget.hintText,
          ),
          items: widget.options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.controller.text = newValue ?? "";
            });
          },
          validator: widget.validator,
        ),
      ],
    );
  }
}

// How to use
// final TextEditingController _selectedCityController = TextEditingController();
// CustDropdown(
//                   controller: _selectedCityController,
//                   labelText: "Select City",
//                   hintText: "Choose your city",
//                   options: [
//                     "New York",
//                     "Los Angeles",
//                     "Chicago",
//                     "Houston",
//                     "Miami"
//                   ], //  Custom list
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please select a city";
//                     }
//                     return null;
//                   },
//                 ),
