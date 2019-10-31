import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class ReviewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewState();
}

class ReviewState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Text('ReviewPage')
        ],
      ),
    );
  }
}
