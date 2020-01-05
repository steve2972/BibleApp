import 'package:bible_test2/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


class HomeShare extends StatelessWidget {
  const HomeShare({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                icon: Icon(CupertinoIcons.profile_circled),
                color: Styles.lightIcon,
                iconSize: 60,
                onPressed: (){},
              ),
            ),
            FlatButton(
              onPressed: (){},
              child:
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "공급하실 말씀 있으신가요?",
                  ),
                ),
            )
          ],
        ),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {},                
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(OMIcons.videoCall, color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('동영상'),
                    )
                  ],
                ),
              ),
              //Spacer(),
              VerticalDivider(),
              FlatButton(
                onPressed: () {},              
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(OMIcons.photoLibrary,
                       color: Colors.green,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('사진'),
                    )
                  ],
                ),
              ),
              //Spacer(),
              VerticalDivider(),
              FlatButton(
                onPressed: () {},             
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(OMIcons.pinDrop, color: Colors.pink,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('교회방문'),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}