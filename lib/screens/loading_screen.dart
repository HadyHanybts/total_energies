import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 158, 158, 158),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Loading Indicator
            CircularProgressIndicator(
              color: primaryColor, // Change to your theme color
            ),
            SizedBox(height: 20),
            // Loading Text
            Text(
              "Total Energies....",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
