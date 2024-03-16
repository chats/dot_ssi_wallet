class ExamTest {
  final String examinerId;
  final String examTitle;
  final String examRound;
  final String generalStartExamDate;
  final String generalEndExamDate;
  final String location;
  final String idCardNumber;
  final String nameTh;
  final String nameEn;
  final String phone;
  final String email;

  ExamTest({
    required this.examinerId,
    required this.examTitle,
    required this.examRound,
    required this.generalStartExamDate,
    required this.generalEndExamDate,
    required this.location,
    required this.idCardNumber,
    required this.nameTh,
    required this.nameEn,
    required this.phone,
    required this.email,
  });

  factory ExamTest.fromJson(Map<String, dynamic> json) {
    return ExamTest(
      examinerId: json['examiner_id'],
      examTitle: json['exam_title'],
      examRound: json['exam_round'],
      generalStartExamDate: json['general_start_exam_date'],
      generalEndExamDate: json['general_end_exam_date'],
      location: json['location'],
      idCardNumber: json['id_card_number'],
      nameTh: json['name_th'],
      nameEn: json['name_en'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'examiner_id': examinerId,
      'exam_title': examTitle,
      'exam_round': examRound,
      'general_start_exam_date': generalStartExamDate,
      'general_end_exam_date': generalEndExamDate,
      'location': location,
      'id_card_number': idCardNumber,
      'name_th': nameTh,
      'name_en': nameEn,
      'phone': phone,
      'email': email,
    };
  }
}
