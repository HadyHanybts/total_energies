class CarBrand {
  final String english;
  final String arabic;

  CarBrand({required this.english, required this.arabic});

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      english: json['English'],
      arabic: json['Arabic'],
    );
  }
}
