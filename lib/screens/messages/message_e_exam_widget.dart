import 'package:flutter/material.dart';

import '../../services/core/e_exam_service.dart';

Widget eExamConnected(BuildContext context, dynamic payload) {
  //final data =
  //    proposeEExamCredential(payload['connection_id'], payload['issuer_did']);
  //return Container();
  return FutureBuilder(
      future: proposeEExamCredential(
          payload['connection_id'], payload['their_did']),
      builder: (context, snapshot) => Container(
            child: Text('E-Exam data proposed to the issuer.'),
          ));
}
