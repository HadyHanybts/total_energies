// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:total_energies/models/register_to_promo_model.dart';

// class RegisterToPromotionService {
//   final String regUrl =
//       "http://92.204.139.204:4335/api/Customer/RegisterToPromo";

//   // Create (Register)
//   Future<http.Response> RegisterToPromo(
//       CustSerial, PromotionCode, EventSerial) async {
//     final response = await http.get(
//       Uri.parse(
//           '$regUrl/' + CustSerial + '/' + PromotionCode + '/' + EventSerial),
//       headers: {"Content-Type": "application/json"},
//     );
//     return response;
//   }
// }

import 'package:http/http.dart' as http;

class RegisterToPromotionService {
  // final String baseUrl =
  //     "http://92.204.139.204:4335/api/Customer/RegisterToPromo";

final String baseUrl =
      "https://www.besttopsystems.net:4336/api/Customer/RegisterToPromo";


  // Register a customer to a promotion
  Future<http.Response> registerToPromo(
      int custSerial, String promotionCode, int eventSerial) async {
    final String url = "$baseUrl/$custSerial/$promotionCode/$eventSerial";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      return response;
    } catch (e) {
      throw Exception("Failed to register to promotion: $e");
    }
  }
}
