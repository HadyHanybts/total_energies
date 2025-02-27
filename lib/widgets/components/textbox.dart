import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  const Textbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Text(
        "data",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
