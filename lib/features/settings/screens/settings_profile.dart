import 'package:dot_ssi_wallet/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../controllers/settings_profile_controllers.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: AssetImage("assets/images/person-M.png"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              buildForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<SettingsProfileController>(
        init: SettingsProfileController(),
        builder: (profileController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //filled: true,
                  labelText: "Name",
                  hintText: "John Smith",
                ),
              ),
              fieldSpacer(),
              Obx(
                () => TextFormField(
                  controller:
                      TextEditingController(text: profileController.walletId),
                  obscureText: !profileController.walletIdVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    //filled: true,
                    labelText: "Wallet ID",
                    hintText: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                    suffixIcon: IconButton(
                      onPressed: () {
                        profileController.walletIdVisible =
                            !profileController.walletIdVisible;
                      },
                      icon: Icon(profileController.walletIdVisible
                          ? Symbols.visibility
                          : Symbols.visibility_off),
                    ),
                  ),
                ),
              ),
              fieldSpacer(),
              Obx(
                () => TextFormField(
                  controller:
                      TextEditingController(text: profileController.walletKey),
                  obscureText: !profileController.walletKeyVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    //filled: true,
                    labelText: "Wallet Key",
                    suffixIcon: IconButton(
                      onPressed: () {
                        profileController.walletKeyVisible =
                            !profileController.walletKeyVisible;
                      },
                      icon: Obx(
                        () => Icon(profileController.walletKeyVisible
                            ? Symbols.visibility
                            : Symbols.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
              fieldSpacer(),
              Obx(
                () => TextFormField(
                  obscureText: !profileController.agentUrlVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Agent URL",
                    suffixIcon: IconButton(
                      onPressed: () {
                        // Toggle Agent URL Visibility.
                        profileController.agentUrlVisible =
                            !profileController.agentUrlVisible;
                      },
                      icon: Icon(profileController.agentUrlVisible
                          ? Symbols.visibility
                          : Symbols.visibility_off),
                    ),
                  ),
                  controller: TextEditingController(text: agentUrl),
                ),
              ),
              fieldSpacer(),
              Obx(
                () => TextFormField(
                  obscureText: !profileController.agentWssVisible,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Agent WSS",
                    suffixIcon: IconButton(
                      onPressed: () {
                        profileController.agentWssVisible =
                            !profileController.agentWssVisible;
                      },
                      icon: Icon(profileController.agentWssVisible
                          ? Symbols.visibility
                          : Symbols.visibility_off),
                    ),
                  ),
                  controller: TextEditingController(text: agentWss),
                ),
              ),
              fieldSpacer(),
              Obx(
                () => TextFormField(
                  obscureText: !profileController.agentKeyVisible,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Agent API Key",
                      suffixIcon: IconButton(
                        onPressed: () {
                          profileController.agentKeyVisible =
                              !profileController.agentKeyVisible;
                        },
                        icon: Icon(profileController.agentKeyVisible
                            ? Symbols.visibility
                            : Symbols.visibility_off),
                      )
                      //hintText: "123456",
                      ),
                  controller: TextEditingController(text: agentKey), //agentKey
                ),
              ),
              fieldSpacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                //ElevatedButton(
                //  onPressed: () {},
                //  child: Text("Cancel"),
                //),
                //SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor:
                        theme.colorScheme.onPrimary, // Background color
                  ),
                  onPressed: () {},
                  child: const Text("Update"),
                )
              ]),
            ],
          );
        },
      ),
    ));
  }

  Widget fieldSpacer() {
    return SizedBox(height: 16);
  }
}
