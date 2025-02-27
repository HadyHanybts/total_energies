import 'package:flutter/material.dart';

class PromoCircle extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;

  const PromoCircle({
    super.key,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
