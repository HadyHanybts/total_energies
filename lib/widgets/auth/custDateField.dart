import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class CustDatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  // final String label;
  final String hintText;
  final DateTime dateFrom; // ✅ Minimum date
  final DateTime dateTo; // ✅ Maximum date
  final String? Function(String?)? validator;

  const CustDatePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    // required this.label,
    required this.hintText,
    required this.dateFrom,
    required this.dateTo,
    this.validator,
  });

  @override
  _CustDatePickerFieldState createState() => _CustDatePickerFieldState();
}

class _CustDatePickerFieldState extends State<CustDatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.dateFrom, // Default to minimum date
      firstDate: widget.dateFrom, // Enforce min date
      lastDate: widget.dateTo, // Enforce max date
    );

    setState(() {
      widget.controller.text =
          "${pickedDate?.day}-${pickedDate?.month}-${pickedDate?.year}"; // Format date
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        readOnly: true, // Prevent manual input
        style: TextStyle(color: inputTextColor), // Toggle password visibility

        decoration: InputDecoration(
          // labelText: widget.labelText,
          label: RichText(
            text: TextSpan(
              text: widget.labelText, // Translated label
              style: TextStyle(
                  color: Colors.black, fontSize: 16), // Default label color
              children: [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16), // Red *
                ),
              ],
            ),
          ),
          labelStyle: TextStyle(color: inputTextColor),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: inputTextColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: txtfieldborderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: txtfieldborderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green, width: 2.0), // Change focus border color
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: primaryColor,
            ),
            onPressed: () => _selectDate(context), // Open date picker
          ),
        ),
        validator: widget.validator,
        onTap: () =>
            _selectDate(context), // Open date picker when tapping the field
      ),
    );
  }
}
