class ExamSeat {
  final String examId;
  final DateTime examDate;
  final String place;
  final String room;
  final String seat;
  final String citizenId;
  final String name;
  final String email;
  final String phone;

  ExamSeat({
    required this.examId,
    required this.examDate,
    required this.place,
    required this.room,
    required this.seat,
    required this.citizenId,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory ExamSeat.fromJson(Map<String, dynamic> json) {
    return ExamSeat(
      examId: json['exam_id'],
      examDate: DateTime.parse(json['exam_date']),
      place: json['place'],
      room: json['room'],
      seat: json['seat'],
      citizenId: json['cid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'examId': examId,
      'examDate': examDate.toIso8601String(),
      'place': place,
      'room': room,
      'seat': seat,
      'citizenId': citizenId,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
