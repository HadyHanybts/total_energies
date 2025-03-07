class PromotionsModel {
  final int serial;
  final String eventTopic;
  final DateTime startDate;
  final DateTime endDate;
  final int maxParticipants;
  final String imagePath;
  final String eventDescription;
  final String eventEnDescription;
  final bool happyHoursYN;
  final int qrMaxUsage;

  PromotionsModel({
    required this.serial,
    required this.eventTopic,
    required this.startDate,
    required this.endDate,
    required this.maxParticipants,
    required this.imagePath,
    required this.eventDescription,
    required this.eventEnDescription,
    required this.happyHoursYN,
    required this.qrMaxUsage,
  });

  factory PromotionsModel.fromJson(Map<String, dynamic> json) {
    return PromotionsModel(
      serial: json['serial'],
      eventTopic: json['eventTopic'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      maxParticipants: json['maxParticipants'] ?? 0,
      imagePath: json['imagePath'] ?? '',
      eventDescription: json['eventDescription'] ?? '',
      eventEnDescription: json['eventEnDescription'] ?? '',
      happyHoursYN: json['happyHoursYN'] ?? false,
      qrMaxUsage: json['qrMaxUsage'] ?? 0,
    );
  }
}
