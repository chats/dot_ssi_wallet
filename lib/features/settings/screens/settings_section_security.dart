import 'package:dot_ssi_wallet/features/settings/screens/settings_section_title.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
            leading: Icon(Symbols.lock),
            trailing: Icon(Symbols.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("Change PIN"),
            leading: Icon(Symbols.pin),
            trailing: Icon(Symbols.arrow_forward_ios),
          ),
          ListTile(
            title: Text("Biometric authentication"),
            leading: Icon(Symbols.fingerprint),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            title: Text("Sign out"),
            leading: Icon(Symbols.exit_to_app),
            trailing: Icon(Symbols.arrow_forward_ios),
          ),
        ]),
      )
    ]);
  }
}
