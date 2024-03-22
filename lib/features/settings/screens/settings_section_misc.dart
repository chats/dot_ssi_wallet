import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'settings_section_title.dart';

class SettingsSectionMisc extends StatelessWidget {
  const SettingsSectionMisc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionTitle(title: "Misc"),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text("Term of Service"),
                leading: Icon(Symbols.description),
                trailing: Icon(Symbols.arrow_forward_ios),
              ),
              ListTile(
                title: Text("Open Source Licenses"),
                leading: Icon(Icons.book),
                trailing: Icon(Symbols.arrow_forward_ios),
              ),
            ],
          ),
        )
      ],
    );
  }
}
