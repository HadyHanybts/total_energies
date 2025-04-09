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
          // Text widget for the label
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 12, color: inputTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
