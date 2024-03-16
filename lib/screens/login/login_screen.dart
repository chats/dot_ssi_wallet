import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Login'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
