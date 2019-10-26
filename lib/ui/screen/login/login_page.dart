import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werry/config/router_manger.dart';
import 'package:werry/config/storage_manager.dart';
import 'package:werry/generated/i18n.dart';
import 'package:werry/provider/provider_widget.dart';
import 'package:werry/ui/widget/app_bar.dart';
import 'package:werry/ui/widget/button_progress_indicator.dart';
import 'package:werry/ui/widget/login/login_bg_widget.dart';
import 'package:werry/utils/text_styles_utils.dart';
import 'package:werry/viewmodel/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/login/login_field_widget.dart';

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
              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      LoginTextField(
                        label: S.of(context).login_username,
                        icon: Icons.perm_identity,
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (text) {
                          FocusScope.of(context).requestFocus(_pwdFocus);
                        },
                      ),
                      LoginTextField(
                        controller: _passwordController,
                        label: S.of(context).login_password,
                        icon: Icons.lock_outline,
                        obscureText: true,
                        focusNode: _pwdFocus,
                        textInputAction: TextInputAction.done,
                      ),
                      LoginButton(_nameController, _passwordController),
                      SingUpWidget(_nameController),
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).appName, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextContentRegister() => Text(S.of(context).appName, style: TextStylesUtils.styleAvenir14WhiteW600);

}


class LoginButton extends StatelessWidget {
  final nameController;
  final passwordController;

  LoginButton(this.nameController, this.passwordController);

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
    print(prefs.getInt('counter'));
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
    return LoginButtonWidget(
      child: model.busy
          ? ButtonProgressIndicator()
          : Text(
              S.of(context).signIn,
              style: Theme.of(context).accentTextTheme.title.copyWith(wordSpacing: 6),
            ),
      onPressed:()=> _incrementCounter(),
      /*onPressed: model.busy
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
              }
            },*/
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  LoginButtonWidget({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor.withAlpha(180);
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
        child: CupertinoButton(
          padding: EdgeInsets.all(0),
          color: color,
          disabledColor: color,
          borderRadius: BorderRadius.circular(110),
          pressedOpacity: 0.5,
          child: child,
          onPressed: onPressed,
        ));
  }
}

class SingUpWidget extends StatefulWidget {
  final nameController;

  SingUpWidget(this.nameController);

  @override
  _SingUpWidgetState createState() => _SingUpWidgetState();
}

class _SingUpWidgetState extends State<SingUpWidget> {
  TapGestureRecognizer _recognizerRegister;

  @override
  void initState() {
    _recognizerRegister = TapGestureRecognizer()
      ..onTap = () async {
        widget.nameController.text = await Navigator.of(context).pushNamed(RouteName.register);
      };
    super.initState();
  }

  @override
  void dispose() {
    _recognizerRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(text: S.of(context).noAccount, children: [
        TextSpan(
            text: S.of(context).signIn,
            recognizer: _recognizerRegister,
            style: TextStyle(color: Theme.of(context).accentColor))
      ])),
    );
  }
}
