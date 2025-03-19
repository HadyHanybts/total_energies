import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:total_energies/models/promotions_model.dart';

class GetCurrPromoService {
  final String baseUrl =
      "https://www.besttopsystems.net:4336/api/PromotionEvent/GetAllValidPormotionByCustomerSerial";

  Future<List<PromotionsModel>> getCurrPromotions(int customerSerial) async {
    final url = Uri.parse("$baseUrl/$customerSerial");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        return jsonData.map((json) => PromotionsModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load promotions: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching promotions: $e");
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:total_energies/models/promotions_model.dart';

// class GetCurrPromoService {
//   final String baseUrl =
//       "https://www.besttopsystems.net:4336/api/PromotionEvent/GetAllValidPormotionByCustomerSerial";

//   Future<http.Response> getPromotions(int customerSerial) async {
//     final String url = "$baseUrl/$customerSerial";

//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//       );

//       return response;
//     } catch (e) {
//       throw Exception("Failed to register to promotion: $e");
//     }
//   }
// }
