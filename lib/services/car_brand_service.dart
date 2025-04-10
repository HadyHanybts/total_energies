import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:total_energies/models/car_brands_model.dart';

class CarBrandService {
  Future<List<CarBrand>> getCarBrands() async {
    final String response = await rootBundle.loadString('assets/files/car_brands.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => CarBrand.fromJson(item)).toList();
  }
}
