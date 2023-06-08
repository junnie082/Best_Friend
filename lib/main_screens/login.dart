import 'package:best_friend/main_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:best_friend/main_screens/main_community.dart';

class AuthPage extends StatelessWidget {
  final String imageUrl =
      'https://lh3.googleusercontent.com/u/0/drive-viewer/AFGJ81oPOO1KRCND3vAnBoUuOeYrwGeYHTMrn1-_Ei7TLkhQMcKKvidbGXAmEFtNNpztOdTz3K2ZBvG1f7p317aDMpSVbsyDSg=w2940-h1618';

  AuthPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Best_Friend",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ), // 로고 넣을 자리
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
              const Text("회원가입 버튼 text는 추후 수정"),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ]));
  }

  Widget _authButton(Size size, BuildContext context) {
    return Positioned(
      left: 100,
      right: 100,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            if (_formkey.currentState?.validate() != null) {
              //
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
          },
          child: const Text(
            "로그인",
            style: TextStyle(fontSize: 20, color: Colors.white),
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
                    const Text("비밀번호를 잊으셨나요? 비밀번호 찾기")
                  ])),
        ),
      ),
    );
  }
}
