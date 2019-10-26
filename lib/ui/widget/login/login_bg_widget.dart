import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werry/utils/assets_utils.dart';
import 'package:werry/utils/colors_utils.dart';

class BackgroundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ColorsUtils.pale,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        AssetsUtils.bgLogin,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
