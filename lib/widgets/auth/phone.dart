// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/phone_number.dart'; // Import PhoneNumber class
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:flutter/services.dart';

// class CustPhoneField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final String hintText;
//   final String initialCountryCode;
//   final String? Function(PhoneNumber?)?
//       validator; // Change type to accept PhoneNumber?
//   final bool showAsterisk;

//   const CustPhoneField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     required this.hintText,
//     this.initialCountryCode = 'EG',
//     this.validator, // Updated type
//     this.showAsterisk = false,
//   });

//   // Getter for formatted label with optional asterisk
//   Widget get formattedLabel {
//     return RichText(
//       text: TextSpan(
//         text: labelText,
//         style: TextStyle(color: inputTextColor, fontSize: 16),
//         children: showAsterisk
//             ? [
//                 TextSpan(
//                   text: ' *',
//                   style: TextStyle(color: Colors.red, fontSize: 16),
//                 ),
//               ]
//             : [],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 12),
//       child: IntlPhoneField(
//         controller: controller,
//         inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 👈 Add this line
//         decoration: InputDecoration(
//           // labelText: labelText,
//           label: showAsterisk ? formattedLabel : Text(labelText),
//           labelStyle: TextStyle(color: inputTextColor),
//           hintText: hintText,
//           hintStyle: TextStyle(color: inputTextColor),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: txtfieldborderColor, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: txtfieldborderColor, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.green, width: 2.0),
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//           ),
//         ),
//         initialCountryCode: initialCountryCode,
//         disableLengthCheck: true,
//         onChanged: (phone) {
//           print("Phone number entered: ${phone.completeNumber}");
//         },
//         validator: validator, // Now correctly typed
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:total_energies/core/constant/colors.dart';

class CustPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String initialCountryCode;
  final String? Function(PhoneNumber?)? validator;
  final bool showAsterisk;

  const CustPhoneField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.initialCountryCode = 'EG',
    this.validator,
    this.showAsterisk = false,
  });

  @override
  State<CustPhoneField> createState() => _CustPhoneFieldState();
}

class _CustPhoneFieldState extends State<CustPhoneField> {
  int maxLength = 10; // Default
  late List<TextInputFormatter> inputFormatters;

  // Define country-specific digit limits
  final Map<String, int> countryMaxLengths = {
    'EG': 10,
    'US': 10,
    'IN': 10,
    'SA': 9,
    'DE': 11,
    'GB': 10,
    // Add more country codes as needed
  };

  @override
  void initState() {
    super.initState();
    maxLength = countryMaxLengths[widget.initialCountryCode] ?? 10;
    inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(maxLength),
    ];
  }

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

  void updateMaxLength(String countryCode) {
    setState(() {
      maxLength = countryMaxLengths[countryCode] ?? 10;
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxLength),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: IntlPhoneField(
        controller: widget.controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
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
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        initialCountryCode: widget.initialCountryCode,
        disableLengthCheck: true,
        onChanged: (phone) {
          print("Phone number entered: ${phone.completeNumber}");
        },
        onCountryChanged: (country) {
          updateMaxLength(country.code);
        },
        validator: widget.validator,
      ),
    );
  }
}
