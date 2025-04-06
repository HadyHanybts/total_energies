// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:total_energies/models/get_qr_model.dart';

// class QRService {
//   final String baseUrl =
//       'https://www.besttopsystems.net:4336/api/Customer/GenerateQR';

//   Future<GenerateQRResponse> generateQR(GenerateQRRequest request) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(request.toJson()),
//     );

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       return GenerateQRResponse.fromJson(json);
//     } else {
//       throw Exception('Failed to generate QR: ${response.body}');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:total_energies/models/get_qr_model.dart';

class QRService {
  final String baseUrl =
      'https://www.besttopsystems.net:4336/api/Customer/GenerateQR';

  Future<GenerateQRResponse> generateQR(GenerateQRRequest request) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    // print("Request body: ${request.toJson()}");
    // print("Status code: ${response.statusCode}");
    // print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print("QR API response: $json");
      return GenerateQRResponse.fromJson(json);
    } else {
      throw Exception('Failed to generate QR code');
    }
  }
}
