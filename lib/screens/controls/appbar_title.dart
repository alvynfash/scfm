import 'package:flutter/material.dart';
import 'package:scfm/screens/app.dart';

class AppBarTitle extends StatefulWidget {
  AppBarTitle({Key key}) : super(key: key);

  @override
  _AppBarTitleState createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
            'S.C',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text(
          'Finance',
          // style: TextStyle(color: Colors.black),
          style: TextStyle(color: ScfmApp.lightBlueTheme),
        ),
        Text(
          'Management',
          style: TextStyle(color: Colors.black),
          // style: TextStyle(color: ScfmApp.lightBlueTheme),
        ),
      ],
    );
  }
}
