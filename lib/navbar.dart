import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'features/credentials/credential_screen.dart';
import 'features/history/history_screen.dart';
import 'features/home/home_screen.dart';
import 'screens/scan_qr_code_screen.dart';
import 'features/settings/screens/settings_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  static final List<Widget> _bodyWidgets = <Widget>[
    const HomeScreen(),
//    const HomeScreen3(),
    const CredentialScreen(),
    //const TouristGuideLicenseListScreen(),
    const ScanQrCodeScreen(),
    const HistoryScreen(),
//    const ConnectionScreen(),
//    const SimpleCardListScreen()
    const SettingsScreen(),
//    const SettingsScreenOld(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(child: _bodyWidgets[_selectedIndex]),
      body: Navigator(
        onGenerateRoute: (settings) {
          //Widget page = Page1();
          //if (settings.name == 'page2') page = Page2();
          //return MaterialPageRoute(builder: (_) => page);
          return MaterialPageRoute(
              builder: (_) => _bodyWidgets[_selectedIndex]);
        },
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            selectedIcon:
                Icon(Symbols.home, color: Theme.of(context).primaryColor),
            icon: const Icon(
              Symbols.home,
            ),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Symbols.article, color: Theme.of(context).primaryColor),
            //icon: Icon(Symbol. Icons.article_outlined),
            icon: const Icon(
              Symbols.article,
            ),
            label: 'เอกสาร',
          ),
          NavigationDestination(
            //selectedIcon: Icon(Icons.school),
            icon: _buildScanButton(context),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Symbols.history,
              color: Theme.of(context).primaryColor,
            ),
            icon: const Icon(
              Symbols.history,
            ),
            label: 'ประวัติ',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(Symbols.settings, color: Theme.of(context).primaryColor),
            icon: const Icon(
              Symbols.settings,
            ),
            label: 'ตั้งค่า',
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32.5)),
        color: colorScheme.primary,
      ),
      child: Icon(
        Symbols.qr_code_scanner,
        size: 40,
        color: colorScheme.onPrimary,
      ),
    );
  }
}
