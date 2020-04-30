import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _rememberMe = false;

class _LoginPageState extends State<LoginPage> {
  Widget _emailinput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: "輸入 Email",
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _passwdinput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "密碼",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "輸入密碼",
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _forgetpasswd() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("forget password pressed"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          "忘記密碼?",
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _rememberMeCheckbox() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "記住我",
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('login pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        child: Text(
          "登入",
          style: TextStyle(
            color: Color.fromRGBO(54, 55, 149, 1),
            letterSpacing: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _signInWithText() {
    return Column(
      children: <Widget>[
        Text(
          "- 或是 -",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "使用下列方式",
          style: kLabelStyle,
        )
      ],
    );
  }

  Widget _socialloginBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0)
            ],
            image: DecorationImage(image: logo)),
      ),
    );
  }

  Widget _socialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _socialloginBtn(
              () => print(
                    "login with google",
                  ),
              AssetImage('assets/logos/google.jpg'))
        ],
      ),
    );
  }

  Widget _register() {
    return GestureDetector(
      onTap: () => print("Register Pressed"),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "沒有帳號嗎?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          TextSpan(
              text: "註冊",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 92, 151, 1),
                  Color.fromRGBO(54, 55, 149, 1),
                  // Color.fromRGBO(36, 36, 62, 1)
                ],
              )),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '登入',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _emailinput(),
                    SizedBox(
                      height: 15,
                    ),
                    _passwdinput(),
                    _forgetpasswd(),
                    _rememberMeCheckbox(),
                    _loginBtn(),
                    _signInWithText(),
                    _socialBtnRow(),
                    _register()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
