import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json;
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

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

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String> [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]
  );

  GoogleSignInAccount _currentUser;
  String _contactText;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 64,),
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
      replacement: Column(
        children: <Widget>[
          Row(
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

          SizedBox(height: 16,),

          Row(
            children: <Widget>[
              Expanded(child: Divider(indent: 32, endIndent: 16,color: Colors.black,)),
              Text("또는", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),),
              Expanded(child: Divider(indent: 16, endIndent: 32, color: Colors.black,))
            ],
          ),

          SizedBox(height: 16,),

          GoogleSignInButton(
            onPressed: (){},
            darkMode: false,
            borderRadius: 12,
            
          ),

          SizedBox(height: 16,),
          AppleSignInButton(
            style: AppleButtonStyle.black,
            onPressed: (){},
            borderRadius: 12,
          ),
        ],
      ),
    );
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Text(_contactText ?? ''),
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          RaisedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }


  
}