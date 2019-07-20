import 'package:flutter/material.dart';
import 'package:juju_flutter/pages/activity_page.dart';
import 'package:juju_flutter/pages/group_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  var appBarTitles = ['活动', "群组", "通知", "我的"];

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[ActivityPage(), GroupPage(), ActivityPage(),ActivityPage()],
      index: _tabIndex,
    );
  }


  @override
  void initState() {
    super.initState();

    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.equalizer),
        title: Text(appBarTitles[0]),
        backgroundColor: Colors.amberAccent
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.people),
        title: Text(appBarTitles[1]),
        backgroundColor: Colors.teal
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.notifications),
        title: Text(appBarTitles[2]),
        backgroundColor: Colors.deepOrangeAccent
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.assignment_ind),
        title: Text(appBarTitles[3]),
        backgroundColor: Colors.pinkAccent
      )
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    initData();

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitles[_tabIndex],
            style: TextStyle(color: Colors.white),
          ),
//          actions: <Widget>[],
        ),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews.map((BottomNavigationBarItem navigationView) => navigationView).toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),  // bottom
      ),  // scaffold
    );  // material app
  }


}