import 'package:best_friend/data/join_or_login.dart';
import 'package:best_friend/main_screens/login.dart';
import 'package:best_friend/main_screens/main_community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 연결이 아직 확립되지 않은 경우 로딩 화면 표시
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          // 사용자가 로그인한 경우
          return CommunityScreen(email: snapshot.data?.email ?? '');
        } else {
          // 사용자가 로그아웃한 경우
          return ChangeNotifierProvider<JoinOrLogin>.value(
            value: JoinOrLogin(),
            child: AuthPage(),
          );
        }
      },
    );
  }
}
