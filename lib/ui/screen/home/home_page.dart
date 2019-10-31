import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
            Text('HomePage')
        ],
      ),
    );
  }

}
