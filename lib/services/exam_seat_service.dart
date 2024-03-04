import 'package:flutter/foundation.dart';

import '../models/exam_seat_model.dart';
import '../models/verifiable_credential_model.dart';
import 'core/credential_service.dart';

Future<List<ExamSeat>> getExamSeats() async {
  List<VerifiableCredential> credentials = await getCredentials();

  List<ExamSeat> seats = [];

  for (var e in credentials) {
    seats.add(ExamSeat.fromJson(e.attrs));
  }
  if (kDebugMode) {
    print(seats);
  }
  return seats;
}

Future<ExamSeat> getExamSeatByReferent(String credentialId) async {
  VerifiableCredential credential = await getCredentialById(credentialId);

  ExamSeat seat = ExamSeat.fromJson(credential.attrs);

  if (kDebugMode) {
    print(seat);
  }
  return seat;
}
