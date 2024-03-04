import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../models/verifiable_credential_model.dart';
import 'api_service.dart';
import 'my_shared_preferences.dart';

/* ------------------------
 *  Get all credentials
 --------------------------*/
Future<List<VerifiableCredential>> getCredentials() async {
  const api = "credentials";
  const dataKey = "credentials";
  const dataExpire = 0; // 2 minutes

  final pref = MySharedPreferences();

  try {
    Map<String, dynamic> data = {};

    final strdata = await pref.getDataIfNotExpired(dataKey);
    if (strdata != null) {
      data = json.decode(strdata);
    } else {
      data = await APIService.get(api);
      await pref.saveData(dataKey, json.encode(data), expireIn: dataExpire);
    }

    //Initialize connection list;
    List<VerifiableCredential> credentials = [];
    //Import data object to connection list
    data['results'].forEach(
      (cred) => credentials.add(VerifiableCredential.fromJson(cred)),
    );

    //if (kDebugMode) {
    print(json.encode(credentials));
    //}

    return credentials;
  } catch (e) {
    throw e.toString();
  }
}

/* ------------------------
 *  Get all credentials
 --------------------------*/
Future<VerifiableCredential> getCredentialById(String credentialId) async {
  final api = "credential/$credentialId";

  try {
    Map<String, dynamic> data = await APIService.get(api);

    VerifiableCredential credential = VerifiableCredential.fromJson(data);

    if (kDebugMode) {
      print(credential);
    }

    return credential;
  } catch (e) {
    throw e.toString();
  }
}

/* ---------------------------------------------------------
 *  Send credential request to issuer (if received offer)
 -----------------------------------------------------------*/
Future sendCredentialRequest(String credExId) async {
  final api = "issue-credential/records/$credExId/send_request";
  const body = {"auto_remove": true};

  try {
    final result = APIService.post(api, body);
    if (kDebugMode) {
      print(result);
    }
  } catch (e) {
    throw e.toString();
  }
}

/*  --------------------------------------
 *  Remove credential from wallet by id
 ----------------------------------------*/
Future deleteCredential(String credentialId) async {
  final api = "credential/$credentialId";

  try {
    APIService.delete(api);
  } catch (e) {
    throw e.toString();
  }
}
