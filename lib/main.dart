import 'package:dot_ssi_wallet/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/app_constants.dart';
import 'controllers/localization_controller.dart';
import 'helpers/binding.dart';
import 'helpers/shared_prefs_helper.dart';
import 'navbar.dart';
import 'themes/theme_controller.dart';
import 'themes/themes.dart';
import 'utils/dependency_inj.dart' as dep;

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/onts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  //Map<String, Map<String, String>> _languages = await dep.init();
  await SharedPrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    //final localizationController = Get.put(
    //  LocalizationController(sharedPreferences: Get.find<SharedPreferences>()),
    //);
    return GetMaterialApp(
      title: "SSI Wallet",
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
      home: const Navbar(),
      initialRoute: '/',
      routes: appRoutes,
    );
    /*
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
        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
      ),
    );
    */
  }
}
