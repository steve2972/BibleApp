import 'package:bible_test2/Blocs/Login/Authentication.dart';
import 'package:bible_test2/UI/Screens/HomePage.dart';
import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;
  bool _obscureText = true;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }

        cupertinoNavigate(context, HomePage(
          userId: userId,
          auth: widget.auth,
        ));
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;

    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content:
//              new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                toggleFormMode();
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16),
      child: new Form(
        key: _formKey,
        child: new ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 32,),
            showLogo(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                  "요 1:1 \"태초에 말씀께서 계셨다. 말씀은 하나님과 함께 계셨으며, 말씀은 곧 하나님이셨다.\"",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
            ),
            showEmailInput(),
            showPasswordInput(),
            showHiddenPassword(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage(),

          ],
        ),
      ),
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showLogo() {
    return new Container(
      height: MediaQuery.of(context).size.width * 0.5,
      width: MediaQuery.of(context).size.height * 0.5,
      child: Image(
        image: AssetImage('assets/pictures/BTMK_logo.png'),
      )
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          hintText: '이메일',
          icon: new Icon(
            Icons.email,
          )
        ),
        validator: (value) => !isEmail(value) ? '이메일을 입력하세요' : null,
        onSaved: (value) => _email = value.trim(),
        onChanged: (value) {

        },
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: _obscureText,
        maxLength: 16,
        autofocus: false,
        decoration: new InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          hintText: '비밀번호',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          helperText: "16자 이내의 비밀번호를 입력하세요",
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: new Icon(_obscureText ? Icons.visibility: Icons.visibility_off),
          )
        ),
        validator: (value) => value.isEmpty ? '비밀번호를 입력하세요' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new CupertinoButton(
        child: new Text(
            _isLoginForm ? '처음이세요? 회원가입하기' : '계정이 이미 있으신가요? 로그인 하기',
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.blue)),
        onPressed: toggleFormMode);
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(64.0, 45.0, 64.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(_isLoginForm ? '로그인' : '계정 만들기',
                style: new TextStyle(fontSize: 18.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget showHiddenPassword() {
    return Visibility(
      visible: !_isLoginForm,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: _obscureText,
          autofocus: false,
          decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            hintText: '비밀번호를 확인하세요',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            helperText: "비밀번호 확인을 위해 위와 같은 비밀번호를 입력하세요"
          ),
          validator: (value) => value == _password ? '비밀번호를 입력하세요' : null,
          onSaved: (value) => _password = value.trim(),
        ),
      ),

      replacement: Container(),
    );
  }

  bool isEmail(String value) {
    RegExp regExp = new RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$', 
      caseSensitive: false, 
      multiLine: false
    );

    return regExp.hasMatch(value);

  }
}