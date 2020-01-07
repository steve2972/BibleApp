import 'package:bible_test2/UI/Models/Profile/VitalityGroup/GroupModel.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final GroupModel groupData;
  final Function(GroupModel groupData) onTapAction;
  
  const GroupTile({
    this.groupData,
    this.onTapAction,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String neatDate = DateFormat.yMd().add_jm().format(groupData.date);
    //String meetingDate = DateFormat.yMd().add_jm().format(groupData.meetingTime);
    return FlatButton(
      onPressed: (){},
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: IconButton(icon: Icon(Icons.star_border), color: Colors.yellow[700], onPressed: (){},),
            title: Text(groupData.title),
            subtitle: Text(groupData.people, softWrap: true,),
          ),
          Container(height: 1, color: Colors.grey[200],)
        ],
      ),
    );
  }
}