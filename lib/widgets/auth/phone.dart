import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart'; // Import PhoneNumber class
import 'package:total_energies/core/constant/colors.dart';

class CustPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String initialCountryCode;
  final String? Function(PhoneNumber?)?
      validator; // Change type to accept PhoneNumber?

  const CustPhoneField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.initialCountryCode = 'EG',
    this.validator, // Updated type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: IntlPhoneField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: inputTextColor),
          hintText: hintText,
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
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        initialCountryCode: initialCountryCode,
        onChanged: (phone) {
          print("Phone number entered: ${phone.completeNumber}");
        },
        validator: validator, // Now correctly typed
      ),
    );
  }
}
