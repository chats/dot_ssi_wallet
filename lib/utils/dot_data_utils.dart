import 'package:flutter/material.dart';

import '../models/guide_license_model.dart';

class DotDataUtil {
  static Color getRegionColor(String regionId) {
    switch (regionId) {
      case "1":
        {
          return Colors.grey.shade600;
        }
      case "2":
        {
          return Colors.yellow.shade600;
        }
      case "3":
        {
          return Colors.green;
        }
      case "4":
        {
          return Colors.orange.shade600;
        }
      case "5":
        {
          return Colors.indigo;
        }
      default:
        {
          return Colors.black;
        }
    }
  }

  static String setRegionTh(String regionNo) {
    switch (regionNo) {
      case "1":
        return "ทั่วไป";
      case "2":
        return "ภาคกลาง";
      case "3":
        return "ภาคเหนือ";
      case "4":
        return "ภาคตะวันออกเฉียงเหนือ";
      case "5":
        return "ภาคใต้";
      default:
        return "ทั่วไป";
    }
  }

  static String setRegionEn(String regionNo) {
    switch (regionNo) {
      case "1":
        return "General";
      case "2":
        return "Central";
      case "3":
        return "Northern";
      case "4":
        return "Northeastern";
      case "5":
        return "Southern";
      default:
        return "General";
    }
  }

  static GuideLicense guideLicenseFromAttrs(Map<String, dynamic> attrs) {
    return GuideLicense(
      nameEn: attrs["name_en"],
      nameTh: attrs["name_th"],
      licenseNo: attrs["license_no"],
      regionId: attrs["region_id"],
      expiryDate: attrs["expiry_date"],
      dob: attrs["dob"],
      gender: attrs["gender"],
    );
  }
}
