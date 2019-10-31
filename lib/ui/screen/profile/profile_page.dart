import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Text('ProfilePage')
        ],
      ),
    );
  }

}
