class ExamCertificate {
  final String certificateNumber;
  final String certificateType;
  final String titleName;
  final String firstName;
  final String lastName;
  final String idCardNumber;
  final String languageTitle;
  final String createdAt;

  ExamCertificate({
    required this.certificateNumber,
    required this.certificateType,
    required this.titleName,
    required this.firstName,
    required this.lastName,
    required this.idCardNumber,
    required this.languageTitle,
    required this.createdAt,
  });

  factory ExamCertificate.fromJson(Map<String, dynamic> json) {
    return ExamCertificate(
      certificateNumber: json['certificate_number'],
      certificateType: json['certificate_type'],
      titleName: json['title_name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      idCardNumber: json['id_card_number'],
      languageTitle: json['language_title'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificateNumber': certificateNumber,
      'certificateType': certificateType,
      'titleName': titleName,
      'firstName': firstName,
      'lastName': lastName,
      'idCardNumber': idCardNumber,
      'languageTitle': languageTitle,
      'createdAt': createdAt,
    };
  }
}
