import 'package:flutter/material.dart';

import '../../widgets/simple_card_widget.dart';

class SimpleCardListScreen extends StatelessWidget {
  const SimpleCardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Card List'),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(80),
        child: SimpleCard(
          press: () {},
        ),
      )),
    );
  }
}
