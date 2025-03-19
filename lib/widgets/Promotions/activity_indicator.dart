import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 100),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 6,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'promotion_det_page.activity'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              '$completed / $total',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              completed == total ? Icons.check_circle : Icons.timelapse,
              color: completed == total ? Colors.green : Colors.orange,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
