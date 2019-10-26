import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werry/common/constant.dart';
import 'package:werry/config/router_manger.dart';
import 'package:werry/generated/i18n.dart';
import 'package:werry/provider/provider_widget.dart';
import 'package:werry/ui/screen/login/widget/login_bg_widget.dart';
import 'package:werry/ui/screen/login/widget/login_field_widget.dart';
import 'package:werry/ui/screen/register/widget/signin_widget.dart';
import 'package:werry/ui/widget/app_bar.dart';
import 'package:werry/ui/widget/button_progress_indicator.dart';
import 'package:werry/ui/widget/filled_round_button.dart';
import 'package:werry/utils/assets_utils.dart';
import 'package:werry/utils/colors_utils.dart';
import 'package:werry/utils/dimens_utils.dart';
import 'package:werry/utils/sizebox_utils.dart';
import 'package:werry/utils/text_styles_utils.dart';
import 'package:werry/viewmodel/login_model.dart';

class RegisterSuccessPage extends StatefulWidget {
  @override
  _RegisterSuccessPageState createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.pale,
      body: Stack(
        children: <Widget>[
          BackgroundLogin(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildIconWerry(),
                buildTextTitleWerry(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildIconWerry() => Image.asset(
        AssetsUtils.iconWerry,
        width: MediaQuery.of(context).size.width,
        height: DimensUtils.size350,
      );

  Widget buildTextTitleWerry() => Text(S.of(context).appName, style: TextStylesUtils.styleAvenir14WhiteW600);

  Widget buildTextContentWerry() => Text(S.of(context).appName, style: TextStylesUtils.styleAvenir14WhiteW600);

  Widget buildBGTop() => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        child: Image.asset(
          AssetsUtils.bgLoginSusscessTop,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      );
}
