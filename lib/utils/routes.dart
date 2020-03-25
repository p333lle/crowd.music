
import 'package:crowd_music/main.dart';
import 'package:crowd_music/views/login_view/login_view.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => BottomBarNavigation(),
  '/login': (context) => LoginView(),
};


class SecondScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Text('Elias'),
    );
  }
}