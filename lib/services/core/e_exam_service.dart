import 'dart:convert';

import 'package:dot_ssi_wallet/constants/app_constants.dart';
import 'package:dot_ssi_wallet/data/exam_data.dart';
import 'package:flutter/foundation.dart';

import '../../constants/constants.dart';
import 'api_service.dart';

final eExamProposal = {
  "cred_def_id": "WgWxqztrNooG92RXvxSTWv:3:CL:20:tag",
  "connection_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "auto_remove": true
};

dynamic createEExamProposal(String connectionId, String issuerDid) {
  dynamic attrs = [];
  examData.toJson().forEach((key, value) {
    attrs.add({"name": key, "value": value});
  });
  Map<String, dynamic> proposal = {
    "auto_remove": true,
    "comment": "string",
    "connection_id": connectionId,
    "cred_def_id": examTestCredDefs,
    "credential_proposal": {
      "@type": "issue-credential/1.0/credential-preview",
      "attributes": attrs
    },
    "issuer_did": examTestSchemaIssuerDid,
    "schema_id": examTestSchemaId,
    "schema_issuer_did": examTestSchemaIssuerDid,
    "schema_name": examTestSchemaName,
    "schema_version": examTestSchemaVersion,
    "trace": true
  };
  print("Proposal: $proposal");
  return proposal;
}

Future proposeEExamCredential(String connectionId, String issuerDid) async {
  const api = '/issue-credential/send-proposal';
  print("API: $api");

  final Map<String, dynamic> proposal =
      createEExamProposal(connectionId, issuerDid);

  print("Propose E-Exam Credential: $proposal");

  try {
    final result = APIService.post(api, json.encode(proposal));
    if (kDebugMode) {
      print(result);
    }
  } catch (e) {
    throw e.toString();
  }
}
