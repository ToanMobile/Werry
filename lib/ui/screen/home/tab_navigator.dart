import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werry/generated/i18n.dart';
import 'package:werry/ui/screen/challenge/challenge_page.dart';
import 'package:werry/ui/screen/more/more_page.dart';
import 'package:werry/ui/screen/profile/profile_page.dart';
import 'package:werry/ui/screen/review/review_page.dart';
import 'package:werry/utils/assets_utils.dart';
import 'home_page.dart';

List<Widget> pages = <Widget>[
  HomePage(),
  ReviewPage(),
  ChallengePage(),
  ProfilePage(),
  MorePage()
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(AssetsUtils.imageIcon),
            title: Text(S.of(context).tab_home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text(S.of(context).tab_review),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text(S.of(context).tab_challenge),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_split),
            title: Text(S.of(context).tab_personal),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            title: Text(S.of(context).tab_more),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
