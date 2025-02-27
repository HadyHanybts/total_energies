import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';

class ActivityIndicator extends StatelessWidget {
  final int completed;
  final int total;

  const ActivityIndicator({
    super.key,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Activity: ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '$completed / $total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                completed == total ? Icons.check_circle : Icons.timelapse,
                color: completed == total ? Colors.green : Colors.orange,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
