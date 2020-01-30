import 'package:bible_test2/UI/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneRegistrationPage extends StatefulWidget {
  String email; // From previous class
  @override
  _PhoneRegistrationPageState createState() => _PhoneRegistrationPageState();
}

class _PhoneRegistrationPageState extends State<PhoneRegistrationPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneNumController;
  TextEditingController verificationCodeController;
  String _smsVerificationCode;

  bool _isCodeSent = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCodeSent ? _buildEnterCode():_buildSendNumber()
    );
  }

  Widget _buildEnterCode() {
    return Padding(
      padding: EdgeInsets.all(64),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: verificationCodeController,
                decoration: InputDecoration(
                  labelText: "발송 된 코드 입력",
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSendNumber() {
    return Padding(
        padding: EdgeInsets.all(64),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "전화번호 인증",
                  style: Styles.mainText,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 128,),
                TextField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: phoneNumController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "전화번호", 
                    hintText: "xx-xxxx-xxxx",
                    prefixText: "+82", 
                  ),
                ),
                SizedBox(height: 32,),
                showPrimaryButton()
              ],
            ),
          ),
        ),
      );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 1.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text('코드 보내기',
                style: new TextStyle(fontSize: 18.0, color: Colors.white)),

            onPressed: () => _verifyPhoneNumber(context),
          ),
        ));
  }

   _verifyPhoneNumber(BuildContext context) async {
    String phoneNumber = "+82" + phoneNumController.text.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    setState(() {
      _isCodeSent = true;
    });
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
        verificationFailed: (authException) => _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
  }

  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    final snackBar = SnackBar(content: Text("Success!!! UUID is: "));
    Scaffold.of(context).showSnackBar(snackBar);
    /*
    FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
      final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
    */
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }
}