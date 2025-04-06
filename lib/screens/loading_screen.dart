import 'package:flutter/material.dart';
import 'dart:async';

import 'package:total_energies/core/constant/colors.dart';

void main() {
  runApp(const MaterialApp(
    home: LoadingScreen(),
  ));
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int dotCount = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      setState(() {
        dotCount = (dotCount + 1) % 4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Total Energies",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            AnimatedDots(dotCount: dotCount),
          ],
        ),
      ),
    );
  }
}

class AnimatedDots extends StatelessWidget {
  final int dotCount;

  const AnimatedDots({super.key, required this.dotCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: index < dotCount ? 1.0 : 0.2,
          child: const Text(
            ".",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
