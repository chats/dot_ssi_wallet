import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/verifiable_credential_model.dart';
import '../services/core/credential_service.dart';
import '../utils/string_utils.dart';
import 'propose_credential_screen.dart';

class CredentialDetailScreen extends StatelessWidget {
  const CredentialDetailScreen({super.key, required this.credential});

  final VerifiableCredential credential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Credential Details"),
            flexibleSpace: FlexibleSpaceBar(title: Text("xxx")),
          ),
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
          _credentialDetails(credential.attrs),
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

  Widget _attrProp(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(key,
                style: const TextStyle(
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
        const Divider(
          height: 15,
          //color: MyTheme.color.withOpacity(0.4),
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _credentialDetails(Map<String, dynamic> attrs) {
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
                    color: Colors.transparent,
                    child: InkWell(
                        child: const Text("Hide All",
                            style: TextStyle(
                              fontSize: 13,
                              //color: MyTheme.color,
                            )),
                        onTap: () {
                          if (kDebugMode) {
                            print('[Hide All] tapped');
                          }
                        }),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: attrs.length,
              itemBuilder: (context, index) {
                final key = attrs.keys.elementAt(index);
                final value = attrs[key];
                return _attrProp(StringUtil.setCaptialized(key), value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
