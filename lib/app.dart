import 'package:crowd_music/main.dart';
import 'package:crowd_music/utils/colors.dart';
import 'package:crowd_music/utils/routes.dart';
import 'package:crowd_music/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      routes: routes,
      initialRoute: '/login',
    );
  }
}

//Color BACKGROUND_COLOR = Color.fromRGBO(45, 52, 54, 1.0);
//Color FOREGROUND_COLOR = Color.fromRGBO(108, 92, 231, 1.0);

class App extends StatefulWidget {
  State<StatefulWidget> createState() => AppState();
}


class AppState extends State<App> {
  Widget _classChat;
  Widget _dashboard;
  Widget _profile;

  int lastClicked = 1;
  int currentIndex = 1;
  GlobalKey globalKey = GlobalKey(debugLabel: "mainnavigator");



  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: currentIndex,
          key: globalKey,
          onTap: (int value) {
            if (value == lastClicked) {
              // reset to root
            }


            lastClicked = value;
          },
          activeColor: FOREGROUND_COLOR,
          backgroundColor: BACKGROUND_COLOR,


          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('')),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  if (_classChat == null) {
                    _classChat = ProfileView();
                  }

                  return _classChat;
                },
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  if (_dashboard == null) {
                    _dashboard = ProfileView();
                  }

                  return _dashboard;
                },
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  if (_profile == null) {
                    _profile = ProfileView();
                  }

                  return _profile;
                },
              );
              break;
          }
          return null;
        });
  }
}