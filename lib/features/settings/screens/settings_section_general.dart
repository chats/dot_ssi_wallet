import 'package:dot_ssi_wallet/screens/archives/home/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../themes/theme_controller.dart';
import 'settings_section_title.dart';

class SettingsSectionGeneral extends StatefulWidget {
  const SettingsSectionGeneral({super.key});

  @override
  State<SettingsSectionGeneral> createState() => _SettingsSectionGeneralState();
}

class _SettingsSectionGeneralState extends State<SettingsSectionGeneral> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Symbols.dark_mode);
      }
      return const Icon(Symbols.light_mode, color: Colors.grey);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionTitle(title: "General"),
        Card(
          child: Column(children: [
            const ListTile(
              title: Text("Language"),
              leading: Icon(Symbols.language),
              trailing: Icon(Symbols.arrow_forward_ios),
            ),
            ListTile(
              title: const Text("Enable logging"),
              leading: Icon(Symbols.developer_mode),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: const Text("Enable dark mode"),
              leading: Icon(Symbols.dark_mode),
              trailing: GetBuilder<ThemeController>(builder: (controller) {
                return Switch(
                  value: controller.isDark,
                  //value: light,
                  thumbIcon: thumbIcon,
                  onChanged: (bool value) {
                    controller.changeTheme(value);
                    //setState(() {
                    //  light = value;
                    //});
                  },
                );
              }),
            ),
          ] // ListTile(title: Text("Language"), leading: Icon(Icons.language), trailing: Icon(Icons.arrow_forward_ios)),],          ),
              ),
        ),
      ],
    );
  }
}
