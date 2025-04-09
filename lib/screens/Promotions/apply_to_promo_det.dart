import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/widgets/Promotions/activity_indicator.dart';
import 'package:total_energies/widgets/withService/custStationDrpDwn.dart';
import 'package:total_energies/services/register_to_promotion_service.dart'; // Import the service
import 'package:shared_preferences/shared_preferences.dart';

class ApplyToPromoDet extends StatefulWidget {
  final PromotionsModel promotion;

  const ApplyToPromoDet({super.key, required this.promotion});

  @override
  _ApplyToPromoDetState createState() => _ApplyToPromoDetState();
}

class _ApplyToPromoDetState extends State<ApplyToPromoDet> {
  final RegisterToPromotionService _registerService =
      RegisterToPromotionService();
  bool _isLoading = false;

  int custserial = 0;

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      custserial = prefs.getInt('serial') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> _registerToPromo() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _registerService.registerToPromo(
        custserial,
        widget.promotion.promotionDetails[0].promotionCode,
        widget.promotion.serial,
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Registered successfully!",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          mainButton: TextButton(
            onPressed: () {
              Get.closeCurrentSnackbar(); // Closes the snackbar
            },
            child: Icon(Icons.close, color: Colors.white),
          ),
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to register. Try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          mainButton: TextButton(
            onPressed: () {
              Get.closeCurrentSnackbar(); // Closes the snackbar
            },
            child: Icon(Icons.close, color: Colors.white),
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        mainButton: TextButton(
          onPressed: () {
            Get.closeCurrentSnackbar(); // Closes the snackbar
          },
          child: Icon(Icons.close, color: Colors.white),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: widget.promotion.imagePath == null ||
                      widget.promotion.imagePath == ''
                  ? Image.network(widget.promotion.imagePath ?? '')
                  : Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(height: 20),
            Text(
              widget.promotion.eventTopic,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.promotion.eventEnDescription,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  const SizedBox(height: 10),
                  Text(
                      "Start Date: ${widget.promotion.startDate.toString().split(' ')[0]}",
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  const SizedBox(height: 10),
                  Text(
                      'End date: ${widget.promotion.endDate.toString().split(' ')[0]}',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  const SizedBox(height: 10),
                  Text('Max Usage Times : ${widget.promotion.qrMaxUsage}',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _registerToPromo,
                  // onPressed: _isLoading ? null : _registerToPromo,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryColor),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text("Apply",
                          style: const TextStyle(
                              color: btntxtColors, fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
