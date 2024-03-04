import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text("การตั้งค่า"),
          //backgroundColor: MyTheme.color,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              _buildTile(
                context,
                icon: Icons.lock_outline,
                title: "เปลี่ยนรหัสผ่าน",
                onTap: () {
                  print('changepassword');
                },
              ),
              const Divider(height: 0),
              _buildTile(
                context,
                icon: Icons.help_outline,
                title: "ช่วยเหลือ",
                onTap: () {
                  print('help');
                },
              ),
              const Divider(height: 0),
              _buildTile(
                context,
                icon: Icons.exit_to_app,
                title: "ออกจากระบบ",
                onTap: () {
                  print('exit');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Function onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ListTile(
      tileColor: colorScheme.error,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      title: Material(
          color: colorScheme.primaryContainer,
          child: InkWell(
            child: Text(
              title,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                //backgroundColor: colorScheme.primaryContainer,
              ),
            ),
            onTap: () => onTap(),
          )),
    );
  }
}
