import 'package:bible_test2/UI/Widgets/commonTitle.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => new _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = new GlobalKey<FormFieldState<String>>();

  String _name;
  String _lastName;
  String _phoneNumber;
  String _email;
  String _password;
  String _passCheck;

  bool _passwordChanged = false;
  bool _obscureText = true;
  bool _emailVerified = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("프로필 수정", style: TextStyle(color: Colors.black),),
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Styles.lightIcon,
          onPressed: (){Navigator.pop(context);},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            color: Styles.lightIcon,
            onPressed: (){},
          )
        ],
        backgroundColor: Styles.LightAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("프로필 사진", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  CupertinoButton(
                    child: Text("사진 추가", style: TextStyle(color: Colors.blue, fontSize: 18),),
                    onPressed: (){},
                  )
                ],
              ),
              _buildProfilePicture(context),
              Divider(color: Colors.black,),
              buildCommonTitleWidget("개인정보"),
              SizedBox(height: 32,),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        filled: false,
                        //icon: Icon(Icons.person),
                        //hintText: "이름을 작성해 주세요",
                        labelText: "이름",
                        icon: Icon(Icons.person)
                      ),
                      onSaved: (String value) {
                        this._name = value;
                      },
                      validator: _validateName,

                    ),
                  ),
                  SizedBox(width: 16,),
                  Flexible(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        //hintText: "성을 작성해 주세요",
                        labelText: "성",
                        //icon: Icon(Icons.person)
                      ),
                      onSaved: (String value) {
                        this._lastName = value;
                      },
                    ),
                  )
                ],
              ),

              SizedBox(height: 32,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  labelText: "이메일",
                  icon: Icon(Icons.email)
                ),
                onSaved: (String value) {
                  this._email = value;
                },
              ),
              Container(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  onPressed: (){},
                  child: _emailVerified ? Text("이메일 확인되었습니다") : Text("이메일 확인하러 가기"),
                ),
              ),

              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  labelText: "전화번호",
                  icon: Icon(Icons.phone)
                ),
                onSaved: (String value) {
                  this._phoneNumber = value;
                },
              ),
              SizedBox(height: 50,),
              Divider(color: Colors.black,),
              buildCommonTitleWidget("보안"),

              SizedBox(height: 32,),

              _buildPasswordField(
                _passwordFieldKey,
                "비밀번호",
                (String value) {
                  setState(() {
                    this._password = value;
                    print(_password);
                    _passwordChanged = true;
                  });
                },
                _onPasswordEntered
              ),

              SizedBox(height: 32,),

              Visibility(
                child: _buildPasswordField(null, "비밀번호 확인", (String value){this._passCheck = value;}, _onPasswordReEntered),
                replacement: Container(),
                visible: _passwordChanged,
              ),

              SizedBox(height: 128,),

            ],
          )           
        ),
      ),
    );
  }

  String _validateName(String value) {
    if (value.length > 12) return "허용되는 문자 범위를 초과했습니다.";
    return null;
  }
  Widget _buildProfilePicture(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Icon(CupertinoIcons.profile_circled, size: 150, color: Colors.grey[400],),
      ),
    );
  }

  Widget _buildPasswordField(Key fieldKey, String labelText, 
            FormFieldSetter<String> onSaved, Function onChanged) {


    return new TextFormField(
      key: fieldKey,
      obscureText: _obscureText,
      maxLength: 16,
      onSaved: onSaved,
      decoration: new InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        helperText: "16자 이내의 비밀번호",
        icon: Icon(Icons.lock),
        filled: true,
        labelText: labelText,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: new Icon(_obscureText ? Icons.visibility: Icons.visibility_off),
        )
      ),
      onChanged: onChanged
    );
  }

  void _onPasswordEntered(String value) {
    setState(() {
      this._passwordChanged = true;
    });
  }

  void _onPasswordReEntered(String value) {
    setState(() {
      
    });
  }

  
}