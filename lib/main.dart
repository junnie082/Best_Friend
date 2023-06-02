import 'package:best_friend/data/join_or_login.dart';
import 'package:best_friend/main_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value: JoinOrLogin(), child: AuthPage()),
    );
  }
}
