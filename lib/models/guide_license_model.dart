class GuideLicense {
  final String nameEn;
  final String nameTh;
  final String licenseNo;
  final String regionId;
  final String expiryDate;
  final String dob;
  final String gender;

  GuideLicense({
    required this.nameEn,
    required this.nameTh,
    required this.licenseNo,
    required this.regionId,
    required this.expiryDate,
    required this.dob,
    required this.gender,
  });

  factory GuideLicense.fromJson(Map<String, dynamic> json) {
    return GuideLicense(
      nameEn: json["name_en"],
      nameTh: json["name_th"],
      licenseNo: json["license_no"],
      regionId: json["region_id"],
      expiryDate: json["expiry_date"],
      dob: json["dob"],
      gender: json["gender"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name_en": nameEn,
      "name_th": nameTh,
      "license_no": licenseNo,
      "region_id": regionId,
      "expiry_date": expiryDate,
      "dob": dob,
      "gender": gender,
    };
  }
}
