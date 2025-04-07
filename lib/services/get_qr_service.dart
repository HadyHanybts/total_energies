import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:total_energies/models/get_qr_model.dart';

class QRService {
  final String apiUrl = 'https://www.besttopsystems.net:4336/api/Customer/GenerateQR';

  Future<GenerateQRResponse> generateQR(GenerateQRRequest request) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return GenerateQRResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to generate QR code');
    }
  }
}
