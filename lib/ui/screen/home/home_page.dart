import 'package:flutter/material.dart';
import 'package:werry/common/constant.dart';
import 'package:werry/config/router_manger.dart';
import 'package:werry/generated/i18n.dart';
import 'package:werry/ui/widget/filled_round_button.dart';
import 'package:werry/ui/screen/login/widget/login_bg_widget.dart';
import 'package:werry/utils/assets_utils.dart';
import 'package:werry/utils/colors_utils.dart';
import 'package:werry/utils/dimens_utils.dart';
import 'package:werry/utils/sizebox_utils.dart';
import 'package:werry/utils/text_styles_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
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
                buildContent(context),
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

  Widget buildContent(BuildContext context) => Container(
      width: DimensUtils.size300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildContainerSignup(context),
          SizeBoxUtils.hGap30,
          buildContainerRegister(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildTextLoginSocial(),
              Padding(
                padding: EdgeInsets.only(top: DimensUtils.size20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildIconFacebook(),
                    buildIconGoogle(),
                  ],
                ),
              )
            ],
          ),
        ],
      ));

  Container buildContainerSignup(BuildContext context) => Container(
        width: DimensUtils.size300,
        height: DimensUtils.size50,
        child: FilledRoundButton.withGradient(
          radius: DimensUtils.size10,
          gradientColor: Constant.gradient_WaterMelon_Melon,
          text: Text(
            S.of(context).signIn,
            style: TextStylesUtils.styleAvenir14WhiteW600,
          ),
          cb: () {
            Navigator.pushNamed(context, RouteName.login);
          },
        ),
      );

  Container buildContainerRegister(BuildContext context) => Container(
        width: DimensUtils.size300,
        height: DimensUtils.size50,
        child: FilledRoundButton.withColor(
          radius: DimensUtils.size10,
          pureColor: ColorsUtils.white,
          text: Text(
            S.of(context).signUp,
            style: TextStylesUtils.styleAvenir14MelonW600,
          ),
          cb: () {
            Navigator.pushNamed(context, RouteName.register);
          },
        ),
      );

  Widget buildTextLoginSocial() => Container(
        margin: EdgeInsets.only(top: DimensUtils.size20),
        child: Text(S.of(context).orLoginWith, style: TextStylesUtils.styleAvenir14VeryLightW500),
      );

  Widget buildIconFacebook() => Image.asset(AssetsUtils.iconFacebook);

  Widget buildIconGoogle() => Image.asset(AssetsUtils.iconGoogle);

}
