import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';

class QrScreen extends StatelessWidget {
  final PromotionsModel promotion;

  const QrScreen({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: kToolbarHeight,
                child: Image.asset(
                  "assets/images/ADNOC logo1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          // child: promotion.imagePath == null || promotion.imagePath == ''
          //     ? Image.network(promotion.imagePath ?? '')
          //     : Image.asset("assets/images/logo.png"),
          child: promotion.imagePath == null || promotion.imagePath == ''
              ? Image.asset("assets/images/logo.png")
              : Image.network(promotion.imagePath ?? ''),
        ),
      ),
    );
  }
}
