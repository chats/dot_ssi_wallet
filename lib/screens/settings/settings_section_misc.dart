import 'package:flutter/material.dart';

import 'settings_section_title.dart';

class SettingsSectionMisc extends StatelessWidget {
  const SettingsSectionMisc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: "Misc"),
        Card(
          child: Column(
            children: [
              const ListTile(
                title: Text("Term of Service"),
                leading: Icon(Icons.description),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const ListTile(
                title: Text("Open Source Licenses"),
                leading: Icon(Icons.book),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        )
      ],
    );
  }
}
