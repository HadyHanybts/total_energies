import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class CustPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool showAsterisk;

  const CustPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.showAsterisk = false,
  });

  @override
  _CustPasswordFieldState createState() => _CustPasswordFieldState();
}

class _CustPasswordFieldState extends State<CustPasswordField> {
  bool _isObscured = true; // Controls password visibility

  // Getter for formatted label with optional asterisk
  Widget get formattedLabel {
    return RichText(
      text: TextSpan(
        text: widget.labelText,
        style: TextStyle(color: inputTextColor, fontSize: 16),
        children: widget.showAsterisk
            ? [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ]
            : [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(color: inputTextColor),
        obscureText: _isObscured, // Toggle password visibility
        decoration: InputDecoration(
          // labelText: widget.labelText,
          label: widget.showAsterisk ? formattedLabel : Text(widget.labelText),
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
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: primaryColor,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured; // Toggle state
              });
            },
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
