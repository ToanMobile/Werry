import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class ChallengePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChallengeState();
}

class ChallengeState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Text('ChallengePage')
        ],
      ),
    );
  }

}
