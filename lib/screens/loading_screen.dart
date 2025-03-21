// import 'package:flutter/material.dart';
// import 'package:total_energies/core/constant/colors.dart';

// class LoadingScreen extends StatelessWidget {
//   const LoadingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(110, 158, 158, 158),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Animated Loading Indicator
//             CircularProgressIndicator(
//               color: primaryColor, // Change to your theme color
//             ),
//             SizedBox(height: 20),
//             // Loading Text
//             Text(
//               "Total Energies....",
//               style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({super.key});

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat(); // Infinite rotation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _controller.value * 2 * math.pi,
//               child: Image.asset(
//                 "assets/images/logo.png",
//                 width: 200, // Adjust size as needed
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

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
      backgroundColor: Colors.white,
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
