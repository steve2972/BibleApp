import 'package:bible_test2/UI/Screens/MenuPage/SettingsPage/SettingsPage.dart';
import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:bible_test2/UI/Widgets/CupertinoNavigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "구매 방법"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 16, bottom: 16, top: 16), child: Text("내 카드 목록"),),
              _buildCard(Icons.card_giftcard, "BC-7726"),
              Divider(indent: 16, endIndent: 16, color: Colors.black,),
              Padding(padding: EdgeInsets.only(left: 16, bottom: 16, top: 16), child: Text("구매방법 추가"),),
              _buildPaymentMethod(context, Icons.payment, "체크카드 또는 신용카드 추가", null),
              _buildPaymentMethod(context, Icons.local_parking, "PAYCO 추가", null),
              _buildPaymentMethod(context, Icons.card_membership, "카카오페이 추가", null),
              _buildPaymentMethod(context, Icons.card_membership, "Apple Pay", null),
              _buildPaymentMethod(context, Icons.card_membership, "Google Pay", null),
              Divider(indent: 16, endIndent: 16, color: Colors.black,),
              Padding(padding: EdgeInsets.only(left: 16, bottom: 16, top: 16), child: Text("기타 설정"),),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: ListTile(
                  title: Text("추가 설정"),
                  leading: Icon(OMIcons.settings),
                  onTap: () {cupertinoNavigate(context, SettingsPage());}
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String name) {
    return 
    Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: ListTile(
        title: Text(name),
        leading: Icon(icon),
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context, IconData icon, String title, Widget route) {
    return 
    Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: ListTile(
        onTap: (){},
        title: Text(title),
        leading: Icon(icon),
      ),
    );
  }
}