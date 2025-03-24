import 'package:flutter/material.dart';
import 'package:total_energies/models/promotions_model.dart';

class QrScreen extends StatelessWidget {
  final PromotionsModel promotion;

  const QrScreen({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Redeem Promotion")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: promotion.imagePath == null || promotion.imagePath == ''
              ? Image.network(promotion.imagePath ?? '')
              : Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
