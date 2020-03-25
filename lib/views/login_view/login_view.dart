import 'package:crowd_music/views/login_view/login_form.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 250),
          height: 400,
          child: LoginForm(),
        ),
      ),
    );
  }
}