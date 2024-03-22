import 'package:dot_ssi_wallet/features/credentials/credential_screen.dart';
import 'package:dot_ssi_wallet/screens/archives/home/home_screenOLD.dart';
import 'package:dot_ssi_wallet/screens/sockets/socket_event_screen.dart';
import 'package:dot_ssi_wallet/screens/scan_qr_screen.dart';
import 'package:flutter/material.dart';

//import 'screens/credential_details_screen.dart';
import 'features/settings/screens/settings_profile.dart';
import 'features/settings/screens/settings_screen.dart';

final appRoutes = <String, WidgetBuilder>{
  //'/': (BuildContext context) => const HomeScreen(),
  '/credentials': (BuildContext context) => const CredentialScreen(),
  //'/credential-details': (BuildContext context) => const CredentialDetailsScreen(),
  '/scan': (BuildContext context) => const ScanQRScreen(),
  '/messages': (BuildContext context) => const SocketEventScreen(),
  '/settings/profile': (BuildContext context) => const SettingsProfile(),
  '/settings': (BuildContext context) => const SettingsScreen(),
};
