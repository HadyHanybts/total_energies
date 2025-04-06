// class GenerateQRRequest {
//   final int customerId;
//   final int eventId;

//   GenerateQRRequest({required this.customerId, required this.eventId});

//   Map<String, dynamic> toJson() => {
//         "customerId": customerId,
//         "eventId": eventId,
//       };
// }

// class GenerateQRResponse {
//   final String? qrCode;

//   GenerateQRResponse({this.qrCode});

//  factory GenerateQRResponse.fromJson(Map<String, dynamic> json) {
//     return GenerateQRResponse(
//       qrCode: json['qrCode'] ?? json['data']?['qrCode'], 
//     );
//   }
// }

class GenerateQRRequest {
  final int customerId;
  final int eventId;

  GenerateQRRequest({required this.customerId, required this.eventId});

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "eventId": eventId,
      };
}

class GenerateQRResponse {
  final String? image;
  final String? filename;

  GenerateQRResponse({this.image, this.filename});

  factory GenerateQRResponse.fromJson(Map<String, dynamic> json) {
    final qrCode = json['qrCode'] ?? json['data']?['qrCode'];
    return GenerateQRResponse(
      image: qrCode?['image'],
      filename: qrCode?['filename'],
    );
  }
}
