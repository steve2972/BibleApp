import 'package:bible_test2/Repositories/Registration/DistrictSearch.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

enum gender {male, female}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  String temp = "도시";
  gender genderType = gender.male;
  var genders = ['형제', '자매'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: new AppBar(
        elevation: 1,
        backgroundColor: Styles.LightAppBarColor,
        title: Text("개인정보 작성", style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.clear), color: Styles.lightIcon, onPressed: (){Navigator.pop(context);},),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: <Widget>[
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * .2,
                        backgroundColor: Colors.grey[300],
                      ),
                      IconButton(
                        icon: Icon(OMIcons.cameraAlt, size: 28,),
                        onPressed: (){},
                        color: Colors.grey,
                      )
                    ]
                  ),
                ),
                SizedBox(height: 32,),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(OMIcons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          labelText: '이름',
                          hintText: '홍길동'
                        ),
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return '이름을 입력하세요';
                          }
                          return null;
                        },
                      ),
                    ),
                    _buildRadioButton(gender.male),
                    _buildRadioButton(gender.female)

                  ],
                ),
                const SizedBox(height: 16.0),
                _buildPlainTile(context, Icons.phone, "+82 10-2758-2972"),
                const SizedBox(height: 16.0),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(OMIcons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    labelText: '이메일',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return '이메일을 입력하세요';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildSearchTile(context,  Icons.location_city, temp)
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: _buildSearchTile(context, OMIcons.pinDrop, "지역")
                    ),
                  ],
                ),  
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _agreedToTOS,
                        onChanged: _setAgreedToTOS,
                      ),
                      CupertinoButton(
                        onPressed: (){
                          showModalBottomSheet(
                            elevation: 0,
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Container(),
                              );
                            }
                          );
                        },
                        child: const Text(
                          '이용약관 동의',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Spacer(),
                      
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                        
                      ),
                      disabledColor: Colors.grey,
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: _submittable() ? _submit : null,
                      child: const Text('생성하기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTile(BuildContext context, IconData leading, String text) {
    return GestureDetector(
      onTap: () {
        _awaitSearchQuery(context, text);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(leading, color: Colors.grey,),
              SizedBox(width: 16,),
              Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[600]),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlainTile(BuildContext context, IconData leading, String text) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(leading, color: Colors.grey,),
              SizedBox(width: 16,),
              Text(text, style: TextStyle(fontSize: 16, color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRadioButton(gender t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: t,
          groupValue: genderType,
          onChanged: onRadioChange,
        ),

        Text("${genders[t.index]}")
      ],
    );
  }

  void onRadioChange(gender value) {
    setState(() {
      genderType = value;
      print("Profile: person is a $genderType");
    });
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  void _awaitSearchQuery(BuildContext context, String text) async {
    final result = await showSearch(context: context, delegate: DistrictSearch(hintText: text, iscity: true));
    setState(() {
      temp = result;
    });
  }
}