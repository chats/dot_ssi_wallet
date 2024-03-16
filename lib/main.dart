import 'package:dot_ssi_wallet/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_constants.dart';
import 'helpers/binding.dart';
import 'helpers/shared_prefs_helper.dart';
import 'navbar.dart';
import 'themes/theme_controller.dart';
import 'themes/themes.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/onts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) => GetMaterialApp(
              title: "Theme With Getx",
              debugShowCheckedModeBanner: false,
              initialBinding: Binding(),
              theme: Themes.light,
              darkTheme: Themes.dark,
              themeMode: controller.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const Navbar(),
              initialRoute: '/',
              routes: appRoutes,
            ));
    /*
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
    */
  }
}
