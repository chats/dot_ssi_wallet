import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'api_service.dart';

Map<String, dynamic> createPresentation(
    {required String connectionId,
    required String credDefId,
    required Map<String, dynamic> attributes,
    List<Map<String, dynamic>> predicates = const [],
    String comment = ""}) {
  //create presentation attributes
  List<Map<String, dynamic>> _attributes = [];
  attributes.forEach((key, value) {
    _attributes.add({
      "cred_def_id": credDefId,
      "name": key,
      "value": value,
    });
  });
  List<Map<String, dynamic>> _predicates = [];
  predicates.forEach((e) {
    _predicates.add({
      "cred_def_id": credDefId,
      "name": e["name"], // eg. 'highscore'
      "predicate": e["predicate"], //  eg. > , >= , <=
      "threshold": e["threshold"] ?? 0
    });
  });

  //create presentation document
  Map<String, dynamic> presentation = {
    "auto_present": true,
    "auto_remove": true,
    "comment": comment,
    "connection_id": connectionId,
    "presentation_proposal": {
      "@type": "https://didcomm.org/present-proof/1.0/presentation-preview",
      "attributes": _attributes,
      "predicates": _predicates
    },
    "trace": false
  };

  return presentation;
}

Future proposePresentation(
    {required String connectionId,
    required String credDefId,
    required Map<String, dynamic> attributes,
    List<Map<String, dynamic>> predicates = const []}) async {
  final document = createPresentation(
      connectionId: connectionId,
      credDefId: credDefId,
      attributes: attributes,
      predicates: predicates);

  const api = 'present-proof/send-proposal';

  log("document == $document");

  try {
    final result = APIService.post(api, json.encode(document));
    if (kDebugMode) {
      print(result);
    }
  } catch (e) {
    throw e.toString();
  }
}
