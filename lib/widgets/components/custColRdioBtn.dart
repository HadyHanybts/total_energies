import 'package:flutter/material.dart';

class Custcolrdiobtn extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final List<String> options;
  final String? Function(String?)
      validator; // ✅ Validation is passed from parent page

  const Custcolrdiobtn({
    super.key,
    required this.controller,
    required this.labelText,
    required this.options,
    required this.validator, // Required validator function
  });

  @override
  _CustcolrdiobtnState createState() => _CustcolrdiobtnState();
}

class _CustcolrdiobtnState extends State<Custcolrdiobtn> {
  String? _selectedOption; // Stores selected option

  @override
  void initState() {
    super.initState();
    _selectedOption =
        widget.controller.text; // Initialize with controller value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ...widget.options.map((option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                    widget.controller.text = value ?? ""; // Update controller
                  });
                },
              )),
        ],
      ),
    );
  }
}
