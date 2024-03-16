import 'package:dot_ssi_wallet/models/guide_license_model.dart';
import 'package:dot_ssi_wallet/models/verifiable_credential_model.dart';

import '../models/exam_certificate_model.dart';
import '../models/exam_test_model.dart';

List<VerifiableCredential> sampleCardData = [
  VerifiableCredential(
    referent: "license1",
    schemaId: '',
    credDefId: '8dA47QhbtBa1bBA8XrAum2:3:CL:12:license1',
    revRegId: '',
    credRevId: '',
    attrs: GuideLicense(
      nameEn: "John Doe",
      nameTh: "จอห์น โด",
      licenseNo: "1234567890",
      regionId: "1",
      expiryDate: "20240912",
      dob: "1990-01-01",
      gender: 'M',
    ).toJson(),
  ),
  VerifiableCredential(
    referent: "examcert1",
    schemaId: '',
    credDefId: '8dA47QhbtBa1bBA8XrAum2:3:CL:28:examcert1',
    revRegId: '',
    credRevId: '',
    attrs: ExamCertificate(
      certificateNumber: "1234567890",
      certificateType: "1",
      titleName: "นาย",
      firstName: "จอห์น",
      lastName: "โด",
      idCardNumber: "1234567890123",
      languageTitle: "Mr.",
      createdAt: "2022-12-31 13:01:01",
    ).toJson(),
  ),
  /*
  VerifiableCredential(
    referent: "examtest2",
    schemaId: '',
    credDefId: 'UnRNhX4P91RKFu7YppYstY:3:CL:37:examtest2',
    revRegId: '',
    credRevId: '',
    attrs: ExamTest(
      examinerId: "1234567890",
      examTitle: "1",
      examRound: "1",
      generalStartExamDate: "2022-12-31 13:01:01",
      generalEndExamDate: "2022-12-31 16:00:00",
      location: "1",
      idCardNumber: "1234567890123",
      nameTh: "จอห์น โด",
      nameEn: "John Doe",
      phone: "1234567890",
      email: "",
    ).toJson(),
  )*/
];
