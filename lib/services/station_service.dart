import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:total_energies/models/stations_model.dart';

class StationService {
  final String baseUrl = "http://92.204.139.204:4335/api/Station/GetAll";

  Future<List<StationModel>> getStations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => StationModel.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load stations");
    }
  }

  Future<List<StationModel>> getOnlyStations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((data) => StationModel.fromJson(data))
          .where((station) => (station.serial ?? 0) < 20) // Filter serial < 30
          .toList();
    } else {
      throw Exception("Failed to load stations");
    }
  }
}
