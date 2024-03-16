import 'package:flutter/material.dart';

import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text('Credential Wallet'),
          actions: [
            CircleAvatar(
              //backgroundColor: MyTheme.bgColor.withOpacity(0.5),
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.4),
              child: SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 40,
                ),
              ),
              maxRadius: 25,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: HomeBody(),
    );
  }
}
