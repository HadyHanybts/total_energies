class RegisterToPromoModel {
  final int CustSerial;
  final String PromotionCode;
  final int EventSerial;

  RegisterToPromoModel({
    required this.CustSerial,
    required this.PromotionCode,
    required this.EventSerial,
  });

  // Convert JSON to RegisterToPromo
  factory RegisterToPromoModel.fromJson(Map<String, dynamic> json) {
    return RegisterToPromoModel(
      CustSerial: json['CustSerial'],
      PromotionCode: json['PromotionCode'],
      EventSerial: json['EventSerial'],
    );
  }

  // Convert RegisterToPromo to JSON
  Map<String, dynamic> toJson() {
    return {
      'CustSerial': CustSerial,
      'PromotionCode': PromotionCode,
      'EventSerial': EventSerial,
    };
  }
}
