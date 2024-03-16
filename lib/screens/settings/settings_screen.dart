import 'package:dot_ssi_wallet/screens/settings/settings_section_general.dart';
import 'package:dot_ssi_wallet/screens/settings/settings_section_security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'settings_section_misc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                //margin: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text("John Smith",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DID: 1234567890",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("DID: 1234567890",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  leading: CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: AssetImage("assets/images/person-M.png"),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              sectionSpacer(),
              SettingsSectionGeneral(),
              sectionSpacer(),
              SettingsSectionSecurity(),
              sectionSpacer(),
              SettingsSectionMisc()
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSpacer() {
    return SizedBox(height: 16);
  }
}
