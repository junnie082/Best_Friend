import 'package:best_friend/main_screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const testapp());
}

class testapp extends StatelessWidget {
  const testapp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
    );
  }
}
