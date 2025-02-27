import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/screens/qr_screen.dart';
import 'package:total_energies/widgets/components/activity_indicator.dart';

class PromoDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> promo;

  const PromoDetailsScreen({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(promo["title"] ?? "Promotion Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                promo["imageAsset"],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo["title"],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  promo["description"],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ActivityIndicator(completed: promo["used"], total: promo["total"]),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Qrpage()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      "Use Offer",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
