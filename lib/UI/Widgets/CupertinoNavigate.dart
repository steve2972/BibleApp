import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void cupertinoNavigate(BuildContext context, Widget route) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
}
