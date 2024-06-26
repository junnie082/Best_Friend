import 'package:best_friend/data/join_or_login.dart';
import 'package:best_friend/main_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  final String imageUrl =
      'https://lh3.googleusercontent.com/u/0/drive-viewer/AFGJ81oPOO1KRCND3vAnBoUuOeYrwGeYHTMrn1-_Ei7TLkhQMcKKvidbGXAmEFtNNpztOdTz3K2ZBvG1f7p317aDMpSVbsyDSg=w2940-h1618';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Consumer<JoinOrLogin>(
            builder: (context, JoinOrLogin, child) => Text(
              JoinOrLogin.isJoin ? "회원가입" : "로그인",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomeScreen(),
                ),
              );
            },
          ),
        ),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(color: Colors.white),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 850,
                  child: Stack(
                    children: <Widget>[
                      _inputForm(size),
                      _authButton(size, context),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                ),
                Consumer<JoinOrLogin>(
                  builder: (context, joinOrLogin, child) => GestureDetector(
                      onTap: () {
                        joinOrLogin.toggle();
                      },
                      child: Text(
                        joinOrLogin.isJoin
                            ? "이미 계정이 있으신가요? 로그인하기"
                            : "계정이 없으신가요? 회원가입하기",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )),
                ),
                Container(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ]));
  }

  void _login(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('다시 시도해 주세요'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('다시 시도해 주세요'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }

  Widget _authButton(Size size, BuildContext context) {
    return Positioned(
      left: 100,
      right: 100,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: Consumer<JoinOrLogin>(
          builder: (context, joinOrLogin, child) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              if (_formkey.currentState?.validate() != null) {
                joinOrLogin.isJoin ? _register(context) : _login(context);
              }
            },
            child: Text(
              joinOrLogin.isJoin ? "회원가입" : "로그인",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "Email",
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return "이메일 주소를 입력해주세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password",
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return "비밀번호를 입력해주세요";
                        }
                        return null;
                      },
                    ),
                    Container(
                      height: 8,
                    ),
                    Consumer<JoinOrLogin>(
                      builder: (context, value, child) => Opacity(
                          opacity: value.isJoin ? 0 : 1,
                          child: Text("비밀번호를 잊으셨나요? 비밀번호 찾기")),
                    )
                  ])),
        ),
      ),
    );
  }
}
