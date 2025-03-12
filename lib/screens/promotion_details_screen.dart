// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/models/promotions_model.dart';
// import 'package:total_energies/widgets/components/activity_indicator.dart';
// import 'package:total_energies/widgets/withService/custStationDrpDwn.dart';

// class PromotionDetailsScreen extends StatelessWidget {
//   final PromotionsModel promotion;

//   const PromotionDetailsScreen({super.key, required this.promotion});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         title: Container(
//           child: Row(
//             children: [
//               SizedBox(
//                 height: kToolbarHeight, // Matches the AppBar's height
//                 child: Image.asset(
//                   "assets/images/logo.png",
//                   fit: BoxFit.contain, // Makes image cover entire container
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Promotion Image
//             Directionality.of(context) != TextDirection.rtl
//                 ? Center(
//                     child: Container(
//                       child: Image.network(promotion.imagePath),
//                     ),
//                   )
//                 : Center(
//                     child: Container(
//                       child: Image.network(promotion.imagePath),
//                     ),
//                   ),
//             const SizedBox(height: 20),
//             Text(
//               Directionality.of(context) != TextDirection.rtl
//                   ? promotion.eventTopic
//                   : promotion.eventTopic,
//               style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(10),
//               // margin: const EdgeInsets.symmetric(horizontal: 40),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.white, width: 2),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     Directionality.of(context) != TextDirection.rtl
//                         ? promotion.eventEnDescription
//                         : promotion.eventDescription,
//                     style: TextStyle(fontSize: 18, color: Colors.black),
//                   ),
//                   ActivityIndicator(completed: 0, total: promotion.qrMaxUsage),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             StationDropdown(
//               onChanged: (selectedStation) {
//                 print("Selected Station: ${selectedStation?.stationName}");
//               },
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {

//                   },
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStatePropertyAll(primaryColor),
//                   ),
//                   child: Text(
//                     'btn.promotions_det_pag_redeem'.tr,
//                     style: TextStyle(color: btntxtColors, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Statful page
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/models/promotions_model.dart';
// import 'package:total_energies/widgets/components/activity_indicator.dart';
// import 'package:total_energies/widgets/withService/custStationDrpDwn.dart';

// class PromotionDetailsScreen extends StatefulWidget {
//   final PromotionsModel promotion;

//   const PromotionDetailsScreen({super.key, required this.promotion});

//   @override
//   _PromotionDetailsScreenState createState() => _PromotionDetailsScreenState();
// }

// class _PromotionDetailsScreenState extends State<PromotionDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         title: Row(
//           children: [
//             SizedBox(
//               height: kToolbarHeight, // Matches the AppBar's height
//               child: Image.asset(
//                 "assets/images/logo.png",
//                 fit: BoxFit.contain, // Makes image cover entire container
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Promotion Image
//             Center(
//               child: Image.network(widget.promotion.imagePath),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               widget.promotion.eventTopic,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     widget.promotion.eventEnDescription,
//                     style: const TextStyle(fontSize: 18, color: Colors.black),
//                   ),
//                   ActivityIndicator(completed: 0, total: widget.promotion.qrMaxUsage),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             StationDropdown(
//               onChanged: (selectedStation) {
//                 print("Selected Station: ${selectedStation?.stationName}");
//               },
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // TODO: Add button functionality
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStatePropertyAll(primaryColor),
//                   ),
//                   child: Text(
//                     'btn.promotions_det_pag_redeem'.tr,
//                     style: const TextStyle(color: btntxtColors, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/models/promotions_model.dart';
import 'package:total_energies/widgets/components/activity_indicator.dart';
import 'package:total_energies/widgets/withService/custStationDrpDwn.dart';
import 'package:total_energies/services/register_to_promotion_service.dart'; // Import the service

class PromotionDetailsScreen extends StatefulWidget {
  final PromotionsModel promotion;

  const PromotionDetailsScreen({super.key, required this.promotion});

  @override
  _PromotionDetailsScreenState createState() => _PromotionDetailsScreenState();
}

class _PromotionDetailsScreenState extends State<PromotionDetailsScreen> {
  final RegisterToPromotionService _registerService =
      RegisterToPromotionService();
  bool _isLoading = false;

  Future<void> _registerToPromo() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _registerService.RegisterToPromo(
        113, // Replace with actual customer ID
        "111",
        111,
        // widget.promotion.promotionCode,
        // widget.promotion.eventSerial,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Registered successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to register. Try again.",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!",
          backgroundColor: Colors.red, colorText: Colors.white);
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
        title: Row(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Image.asset("assets/images/logo.png", fit: BoxFit.contain),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(widget.promotion.imagePath)),
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
                children: [
                  Text(widget.promotion.eventEnDescription,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                  ActivityIndicator(
                      completed: 0, total: widget.promotion.qrMaxUsage),
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
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _registerToPromo,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primaryColor),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text('btn.promotions_det_pag_redeem'.tr,
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
