import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoreState();
}

class MoreState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Text('MorePage')
        ],
      ),
    );
  }
}
