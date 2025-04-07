class GenerateQRRequest {
  final int customerId;
  final int eventId;

  GenerateQRRequest({required this.customerId, required this.eventId});

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'eventId': eventId,
    };
  }
}
class GenerateQRResponse {
  final String image;
  final String fileName;

  GenerateQRResponse({required this.image, required this.fileName});

  factory GenerateQRResponse.fromJson(Map<String, dynamic> json) {
    return GenerateQRResponse(
      image: json['image'],
      fileName: json['fileName'],
    );
  }
}
