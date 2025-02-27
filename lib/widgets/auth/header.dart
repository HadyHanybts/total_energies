import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class Header extends StatelessWidget {
  String Title;
  Header({
    super.key,
    required this.Title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 250,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/logo1.png",
                  width: 250,
                ),
              ),
            ),
          ],
        ),
        // Center(
        //   child: Image.asset(
        //     "assets/images/logo.png",
        //     height: 200,
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: Text(
            Title,
            style: TextStyle(fontSize: 25, color: inputTextColor),
          ),
        ),
      ],
    );
  }
}
