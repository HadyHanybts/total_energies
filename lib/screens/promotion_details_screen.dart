import 'package:flutter/material.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/screens/testing.dart';
import 'package:total_energies/widgets/components/activity_indicator.dart';
import 'package:total_energies/widgets/withService/custStationDrpDwn.dart';

class PromotionDetailsScreen extends StatelessWidget {
  final PromotionsModel promotion;

  const PromotionDetailsScreen({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: backgroundColor, title: Text(promotion.eventTopic)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotion Image
            Directionality.of(context) != TextDirection.rtl
                ? Center(
                    child: Container(
                      child: Image.asset(
                        promotion.imagePath.isEmpty
                            ? promotion.imagePath
                            : 'assets/images/logo.png',
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      child: Image.asset(
                        promotion.imagePath.isEmpty
                            ? promotion.imagePath
                            : 'assets/images/logo1.png',
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            Text(
              Directionality.of(context) != TextDirection.rtl
                  ? promotion.eventTopic
                  : promotion.eventTopic,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    Directionality.of(context) != TextDirection.rtl
                        ? promotion.eventEnDescription
                        : promotion.eventDescription,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  ActivityIndicator(completed: 0, total: promotion.qrMaxUsage),
                ],
              ),
            ),
            const SizedBox(height: 20),
            StationDropdown(
              onChanged: (selectedStation) {
                print("Selected Station: ${selectedStation?.stationName}");
              },
            ),
            const SizedBox(height: 20),
            // ActivityIndicator(completed: 0, total: promotion.qrMaxUsage),
            // const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Testing(), // Replace with your page widget
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryColor),
                    // fixedSize:
                    //     WidgetStateProperty.all(Size(double.maxFinite, 20)),
                  ),
                  child: Text(
                    'Redeem Promotion',
                    style: TextStyle(color: btntxtColors, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
