class CityModel {
  final int? serial;
  final String cityArabicName;
  final String cityName;

  CityModel({
    this.serial,
    required this.cityArabicName,
    required this.cityName,
  });

  // Convert JSON to CityModel
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      serial: json['serial'],
      cityArabicName: json['cityArabicName'],
      cityName: json['cityName'],
    );
  }

  // Convert CityModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityArabicName': cityArabicName,
      'cityName': cityName,
    };
  }
}
