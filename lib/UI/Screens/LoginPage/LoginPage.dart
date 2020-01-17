import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  String _email;
  String _password;
  bool _obscureText = true;
  bool _passwordEntered = false;
  bool _emailEntered = false;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: ClampingScrollPhysics(

        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.height * 0.5,
              child: Image(
                image: AssetImage('assets/pictures/BTMK_logo.png'),
              )
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                  "요 1:1 \"태초에 말씀께서 계셨다. 말씀은 하나님과 함께 계셨으며, 말씀은 곧 하나님이셨다.\"",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
            ),
            Form(
              key: _formKey,
              child: 
              Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      labelText: "이메일",
                      icon: Icon(Icons.email)
                    ),
                    validator: (String value) {
                      return isEmail(value) ? null : "이메일 주소가 올바르지 않습니다";
                    },
                    onChanged: (String value) {
                      setState(() {
                        _emailEntered = true;
                      });
                    },
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    obscureText: _obscureText,
                    maxLength: 16,
                    validator: (String value) {
                      return isPassword(value) ? null : "비밀번호가 올바르지 않습니다";
                    },
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      helperText: "16자 이내의 비밀번호",
                      icon: Icon(Icons.lock),
                      labelText: "비밀번호",
                      suffixIcon: new GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: new Icon(_obscureText ? Icons.visibility: Icons.visibility_off),
                      )
                    ),
                    onChanged: (String value) {
                     setState(() {
                       _passwordEntered = true;
                     });
                    },
                  ),
                  buildVisibleButton(context)
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isEmail(String value) {
    RegExp regExp = new RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$', 
      caseSensitive: false, 
      multiLine: false
    );

    return regExp.hasMatch(value);

  }

  bool isPassword(String value) {
    if (value.isEmpty) return false;
    return true;
  }

  Widget buildVisibleButton(BuildContext context) {
    return Visibility(
      visible: _emailEntered && _passwordEntered,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: CupertinoButton.filled(
          child: Text("로그인"),
          onPressed: (){
            if (_formKey.currentState.validate()) {
              print("Hello");
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("데이터 처리 중"),));
            }
          },
        ),
      ),
      replacement: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Spacer(),
          Text("처음이신가요?",
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.end,
          ),
          CupertinoButton(
            child: Text(
              "회원가입하러 가기",
              style: TextStyle(color: Colors.blue, fontSize: 13),
            ),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}