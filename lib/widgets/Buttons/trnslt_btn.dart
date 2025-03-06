import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/core/constant/colors.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor, // Change this to your desired color
        // foregroundColor: Colors.white,
      ),
      onPressed: () {
        // Toggle language between English & Arabic
        var currentLocale = Get.locale?.languageCode;
        if (currentLocale == 'en') {
          Get.updateLocale(Locale('ar', 'AE')); // Switch to Arabic
        } else {
          Get.updateLocale(Locale('en', 'US')); // Switch to English
        }
      },
      child: Text(
        Get.locale?.languageCode == 'ar'
            ? 'English'
            : 'العربية', // Change button text dynamically
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
