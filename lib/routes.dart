import 'package:dot_ssi_wallet/screens/credential_screen.dart';
import 'package:dot_ssi_wallet/screens/home/home_screen.dart';
import 'package:dot_ssi_wallet/screens/messages/message_screen.dart';
import 'package:dot_ssi_wallet/screens/scan_qr_screen.dart';
import 'package:flutter/material.dart';

//import 'screens/credential_details_screen.dart';
import 'screens/settings/profile/settings_profile.dart';
import 'screens/settings/settings_screen.dart';

final appRoutes = <String, WidgetBuilder>{
  //'/': (BuildContext context) => const HomeScreen(),
  '/credentials': (BuildContext context) => const CredentialScreen(),
  //'/credential-details': (BuildContext context) => const CredentialDetailsScreen(),
  '/scan': (BuildContext context) => const ScanQRScreen(),
  '/messages': (BuildContext context) => const MessageScreen(),
  '/settings/profile': (BuildContext context) => const SettingsProfile(),
  '/settings': (BuildContext context) => const SettingsScreen(),
};
