import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class CustConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController
      passwordController; // ✅ Reference to original password
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;

  const CustConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController, // ✅ Added password controller
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  @override
  _CustConfirmPasswordFieldState createState() =>
      _CustConfirmPasswordFieldState();
}

class _CustConfirmPasswordFieldState extends State<CustConfirmPasswordField> {
  bool _isObscured = true; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscured,
        style: TextStyle(color: inputTextColor), // Toggle password visibility
        decoration: InputDecoration(
          labelText: widget.labelText,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Confirm Password is required";
          } else if (value != widget.passwordController.text) {
            return "Passwords do not match";
          }
          return null; // Valid input
        },
      ),
    );
  }
}
