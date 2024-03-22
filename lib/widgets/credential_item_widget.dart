import 'package:flutter/material.dart';

import '../models/verifiable_credential_model.dart';
import '../screens/propose_credential_screen.dart';
import '../services/core/credential_service.dart';

class CredentialItem extends StatelessWidget {
  const CredentialItem({super.key, required this.credential});

  final VerifiableCredential credential;

  @override
  Widget build(BuildContext context) {
    final attrs = credential.attrs;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Credential Details"),
            //  flexibleSpace: FlexibleSpaceBar(title: Text("xxx")),
          ),
          // ******************************************
          // *** This will show physical card image ***
          // ******************************************
          //SliverToBoxAdapter(
          //  child: Padding(
          //    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          //    child: TourGuideLicenseCard(
          //      width: 320,
          //      license: license,
          //      press: () {},
          //    ),
          //  ),
          //),
          _credentialAttrs(attrs),
          _actionsBar(context)
        ],
      ),
    );
  }

  Widget _credentialAttrs(Map<String, dynamic> attrs) {
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
            Row(
              children: [
                SizedBox(
                  child: ListView.builder(
                    itemCount: attrs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final key = attrs.keys.elementAt(index);
                      final value = attrs.values.elementAt(index);
                      return _attrProp(key, value);
                    },
                  ),
                ),
              ],
            )
            /*
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
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _attrProp(String key, String value) {
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

  Widget _actionsBar(BuildContext context) {
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
}
