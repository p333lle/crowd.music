
import 'package:crowd_music/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';


class NavigatorPage extends StatefulWidget {
  const NavigatorPage({ Key key, this.child }) : super(key: key);

  final Widget child;

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {


  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return widget.child;
          },
        );
      },
    );
  }
}