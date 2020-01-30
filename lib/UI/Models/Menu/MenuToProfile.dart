import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:bible_test2/UI/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bible_test2/UI/Screens/LoginPage/ProfileEditPage.dart';

class MenuToProfile extends StatelessWidget {
  FirebaseUser user;

  MenuToProfile({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FlatButton(
        onPressed: (){cupertinoNavigate(context, ProfileEditPage());},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              foregroundColor: Colors.grey,
              backgroundColor: Colors.grey,
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "송재헌 형제",//user != null ? user.displayName : "이름 설정 안함",
                    style: Styles.titleText,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "steve2972@gmail.com",//user != null ? user.email.toString() : "null",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> getEmail() async{
    return await user.email;
  }

}