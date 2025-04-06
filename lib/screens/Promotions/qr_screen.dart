// import 'package:flutter/material.dart';
// import 'package:total_energies/core/constant/colors.dart';
// import 'package:total_energies/models/promotions_model.dart';

// class QrScreen extends StatelessWidget {
//   final PromotionsModel promotion;

//   const QrScreen({super.key, required this.promotion});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Row(
//             children: [
//               SizedBox(
//                 height: kToolbarHeight,
//                 child: Image.asset(
//                   "assets/images/logo.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(
//                 height: kToolbarHeight,
//                 child: Image.asset(
//                   "assets/images/ADNOC logo1.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           // child: promotion.imagePath == null || promotion.imagePath == ''
//           //     ? Image.network(promotion.imagePath ?? '')
//           //     : Image.asset("assets/images/logo.png"),
//           child: promotion.imagePath == null || promotion.imagePath == ''
//               ? Image.asset("assets/images/logo.png")
//               : Image.network(promotion.imagePath ?? ''),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:total_energies/models/get_qr_model.dart';
import 'package:total_energies/services/get_qr_service.dart';

class QrScreen extends StatefulWidget {
  final int customerId;
  final int eventId;

  const QrScreen({super.key, required this.customerId, required this.eventId});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String? qrCode;
  bool isLoading = true;
  final QRService qrService = QRService();

  @override
  void initState() {
    super.initState();
    fetchQRCode();
  }

  Future<void> fetchQRCode() async {
    try {
      final request = GenerateQRRequest(
        customerId: widget.customerId,
        eventId: widget.eventId,
      );

      final response = await qrService.generateQR(request);
      print("QR Code: ${response.image}");

      setState(() {
        qrCode = response.image;
        print("qrCode assigned in setState: ${qrCode?.substring(0, 30)}...");
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : qrCode != null && qrCode!.isNotEmpty
                ? Image.memory(base64Decode(qrCode!))
                : const Text("No QR code available"),
      ),
    );
  }
}
