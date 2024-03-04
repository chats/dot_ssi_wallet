import 'package:flutter/material.dart';

import '../models/guide_license_model.dart';
import '../utils/datetime_utils.dart';
import '../utils/dot_data_utils.dart';

Widget _licenseProp(String key, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                //color: MyTheme.color,
              )),
          Material(
            child: InkWell(
                child: Text(
                  "Hide",
                  style: TextStyle(
                    fontSize: 12,
                    //color: MyTheme.color,
                  ),
                ),
                onTap: () {
                  print('[Hide] tapped');
                }),
            color: Colors.transparent,
          ),
        ],
      ),
      const SizedBox(height: 10),
      Text(value, style: const TextStyle(fontSize: 13)),
      Divider(
        height: 15,
        //color: MyTheme.color.withOpacity(0.4),
      ),
      const SizedBox(height: 6),
    ],
  );
}

Widget _licenseDetails(GuideLicense license) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
                child: Material(
                  child: InkWell(
                      child: Text("Hide All",
                          style: TextStyle(
                            fontSize: 13,
                            //color: MyTheme.color,
                          )),
                      onTap: () {
                        print('[Hide All] tapped');
                      }),
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          _licenseProp(
            'ใบอนุญาต',
            license.regionId == "1"
                ? DotDataUtil.setRegionTh(license.regionId)
                : "ใบอนุญาตเป็นมัคคุเทศก์เฉพาะภูมิภาค ${DotDataUtil.setRegionTh(license.regionId)}",
          ),
          _licenseProp("เลขที่ใบอนุญาต", license.licenseNo),
          _licenseProp("ชื่อ - นามสกุล", '${license.nameTh}'),
          _licenseProp(
            "วันหมดอายุ",
            DateTimeUtil.toExpiryDate(license.expiryDate, locale: "th_TH"),
          ),
        ],
      ),
    ),
  );
}
