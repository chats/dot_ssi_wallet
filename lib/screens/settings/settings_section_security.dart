import 'package:dot_ssi_wallet/screens/settings/settings_section_title.dart';
import 'package:flutter/material.dart';

class SettingsSectionSecurity extends StatelessWidget {
  const SettingsSectionSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SettingsSectionTitle(title: "Security"),
      Card(
        child: Column(children: [
          const ListTile(
            title: Text("Change password"),
            leading: Icon(Icons.lock),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("Change PIN"),
            leading: Icon(Icons.pin),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text("Biometric authentication"),
            leading: Icon(Icons.fingerprint),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: Text("Sign out"),
            leading: Icon(Icons.exit_to_app),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ]),
      )
    ]);
  }
}
