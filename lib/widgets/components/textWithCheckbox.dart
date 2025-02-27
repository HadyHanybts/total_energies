// import 'package:flutter/material.dart';
// import 'package:total_energies/core/constant/colors.dart';

// class TextWithCheckbox extends StatefulWidget {
//   final String text; // Variable for the text
//   final TextEditingController controller; // Variable for the controller

//   const TextWithCheckbox({
//     super.key,
//     required this.text,
//     required this.controller,
//   });

//   @override
//   _TextWithCheckboxState createState() => _TextWithCheckboxState();
// }

// class _TextWithCheckboxState extends State<TextWithCheckbox> {
//   bool _isChecked = false; // Variable to manage the checkbox state

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Text widget for the label
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(right: 30),
//               child: Text(
//                 widget.text,
//                 style: TextStyle(fontSize: 12, color: inputTextColor),
//               ),
//             ),
//           ),

//           // Checkbox widget
//           Checkbox(
//             value: _isChecked,
//             onChanged: (bool? value) {
//               setState(() {
//                 _isChecked = value ?? false;
//               });
//             },
//             activeColor: Colors.green, // Checkbox color when checked
//           ),

//           // TextField with the controller
//           // Expanded(
//           //   child: TextField(
//           //     controller: widget.controller,
//           //     style: TextStyle(color: Colors.white),
//           //     decoration: InputDecoration(
//           //       border: OutlineInputBorder(),
//           //       labelText: "Enter text",
//           //       labelStyle: TextStyle(color: Colors.white),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class TextWithCheckbox extends StatefulWidget {
  final String text; // Label text
  final bool value; // Boolean to track checkbox state
  final ValueChanged<bool> onChanged; // Callback function

  const TextWithCheckbox({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  _TextWithCheckboxState createState() => _TextWithCheckboxState();
}

class _TextWithCheckboxState extends State<TextWithCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Text widget for the label
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, color: inputTextColor),
            ),
          ),

          // Checkbox widget
          Checkbox(
            value: widget.value,
            onChanged: (bool? value) {
              if (value != null) {
                widget.onChanged(value); // Notify parent widget
              }
            },
            activeColor: Colors.green, // Checkbox color when checked
          ),
        ],
      ),
    );
  }
}
