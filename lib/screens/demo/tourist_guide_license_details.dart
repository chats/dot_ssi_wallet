import 'package:flutter/material.dart';

import '../../models/guide_license_model.dart';
import '../../models/verifiable_credential_model.dart';
import '../../services/core/credential_service.dart';
import '../../utils/datetime_utils.dart';
import '../../utils/dot_data_utils.dart';
import '../../widgets/tourist_guide_license_card2.dart';
import '../propose_credential_screen.dart';
import '../../widgets/tourist_guide_license_card.dart';

class TouristGuideLiceneseDetailsScreen extends StatelessWidget {
  const TouristGuideLiceneseDetailsScreen(
      {super.key, required this.credential});
  final VerifiableCredential credential;

  @override
  Widget build(BuildContext context) {
    GuideLicense license = GuideLicense.fromJson(credential.attrs);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Credential Details"),
            flexibleSpace: FlexibleSpaceBar(title: Text("xxx")),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: TouristGuideLicenseCard2(
                //width: 320,
                press: () {}, credential: credential,
              ),
            ),
          ),
          _licenseDetails(license),
          _buidActionsBar(context)
        ],
      ),
    );
  }

  Widget _buidActionsBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .onPrimary // Background color
                      ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            ProposePresentationScreen(
                          credDefId: credential.credDefId,
                          attributes: credential.attrs,
                        ),
                      ),
                    );
                  },
                  child: Text("Proof"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white // Background color
                      ),
                  onPressed: () {
                    deleteCredential(credential.referent).then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orange,
                            content: Center(
                                child: Text(
                                    'Credential with ref# ${credential.referent}! deleted')),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
}
