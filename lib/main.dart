import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'navbar.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/onts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSI Mobile',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
          useMaterial3: true,
//        textTheme: GoogleFonts .anuphanTextTheme(),
          fontFamily: 'Anuphan'),
      home: const Navbar(),
    );
  }
}
