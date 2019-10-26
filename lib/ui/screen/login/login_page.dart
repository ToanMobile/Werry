import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werry/common/constant.dart';
import 'package:werry/config/router_manger.dart';
import 'package:werry/generated/i18n.dart';
import 'package:werry/provider/provider_widget.dart';
import 'package:werry/ui/screen/login/widget/login_bg_widget.dart';
import 'package:werry/ui/screen/login/widget/signup_widget.dart';
import 'package:werry/ui/widget/app_bar.dart';
import 'package:werry/ui/widget/button_progress_indicator.dart';
import 'package:werry/ui/widget/filled_round_button.dart';
import 'package:werry/utils/colors_utils.dart';
import 'package:werry/utils/dimens_utils.dart';
import 'package:werry/utils/sizebox_utils.dart';
import 'package:werry/utils/text_styles_utils.dart';
import 'package:werry/viewmodel/login_model.dart';
import 'widget/login_field_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pwdFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsUtils.pale,
      appBar: AppBarIcon.back().build(context),
      body: Stack(
        children: <Widget>[
          BackgroundLogin(),
          ProviderWidget<LoginModel>(
            model: LoginModel(),
            onModelReady: (model) {
              _nameController.text = model.getLoginName();
            },
            builder: (context, model, child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(DimensUtils.size40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildTextTitleLogin(),
                      SizeBoxUtils.hGap10,
                      SingUpWidget(_nameController),
                      SizeBoxUtils.hGap40,
                      buildTextUserName(),
                      SizeBoxUtils.hGap10,
                      LoginTextField(
                        label: S.of(context).login_username,
                        icon: Icons.person,
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (text) {
                          FocusScope.of(context).requestFocus(_pwdFocus);
                        },
                      ),
                      SizeBoxUtils.hGap30,
                      buildTextPassword(),
                      SizeBoxUtils.hGap10,
                      LoginTextField(
                        controller: _passwordController,
                        label: S.of(context).login_password,
                        icon: Icons.vpn_key,
                        obscureText: true,
                        focusNode: _pwdFocus,
                        textInputAction: TextInputAction.done,
                      ),
                      SizeBoxUtils.hGap30,
                      LoginButton(_nameController, _passwordController)
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).signIn, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextUserName() => Text(S.of(context).login_username, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextPassword() => Text(S.of(context).login_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);
}

class LoginButton extends StatelessWidget {
  final nameController;
  final passwordController;

  LoginButton(this.nameController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
    Widget child = model.busy
        ? Container(
            height: DimensUtils.size50,
            child: Center(child: ButtonProgressIndicator(),),
          )
        : Container(
            height: DimensUtils.size50,
            child: Center(
              child: Text(
                S.of(context).signIn,
                style: TextStylesUtils.styleAvenir14WhiteW600,
              ),
            ),
          );
    return FilledRoundButton.withGradient(
      radius: DimensUtils.size10,
      gradientColor: Constant.gradient_WaterMelon_Melon,
      child: child,
      cb: () {
        //Navigator.pushNamed(context, RouteName.register);
      },
    );
  }

/* Future<bool>  click () async{
    model.busy
    ? null
        : () {
    var formState = Form.of(context);
    if (formState.validate()) {
    model.login(nameController.text, passwordController.text).then((value) {
    if (value) {
    Navigator.of(context).pop(true);
    } else {
    model.showErrorMessage(context);
    }
    });
    }};};*/

}
