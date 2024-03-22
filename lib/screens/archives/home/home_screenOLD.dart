import 'package:flutter/material.dart';

import 'home_body.dart';

class HomeScreenOld extends StatelessWidget {
  const HomeScreenOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          //backgroundColor: Colors.white,
          title: Text('Credential Wallet'),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/person-M.png"),
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
