import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werry/ui/screen/home/home_page.dart';
import 'package:werry/ui/screen/login/login_page.dart';
import 'package:werry/ui/screen/register/register_page.dart';
import 'package:werry/ui/screen/register/register_success_page.dart';
import 'package:werry/ui/screen/welcome/welcome_page.dart';
import 'package:werry/ui/widget/page_route_anim.dart';

class RouteName {
  static const String welcome = 'welcome';
  static const String tab = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String register_success = 'register_success';
  static const String home = 'home';
  static const String setting = 'setting';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcome:
        return NoAnimRouteBuilder(WelcomePage());
      case RouteName.login:
        return NoAnimRouteBuilder(LoginPage());
      case RouteName.register:
        return NoAnimRouteBuilder(RegisterPage());
      case RouteName.register_success:
        return NoAnimRouteBuilder(RegisterSuccessPage());
      case RouteName.home:
        return NoAnimRouteBuilder(HomePage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
