import 'package:crowd_music/blocs/login_form/login_form_validator.dart';
import 'package:crowd_music/blocs/login_form/login_form_validator_bloc.dart';
import 'package:crowd_music/utils/colors.dart';
import 'package:crowd_music/widgets/inputs/login_input.dart';
import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget {

  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  BuildContext _ctx;

  Widget build(BuildContext context) {
    _ctx = context;
    final loginFormBloc = LoginFormValidatorBloc();
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              LoginInput(stream: loginFormBloc.email, controller: usernameTextController, onChanged: loginFormBloc.emailChanged,labelText: 'Username'),
              LoginInput(stream: loginFormBloc.password, controller: passwordTextController, onChanged: loginFormBloc.passwordChanged,labelText: 'Password',obscureText: true),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: submitButton(loginFormBloc),
              ),
            ],
          ),
        ));
  }


  Widget submitButton(loginFormBloc) {
    return StreamBuilder<bool>(
        stream: loginFormBloc.submitCheck,
        builder: (context, snapshot) =>
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: snapshot.hasData ? () => _submit() : null,
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: snapshot.hasData ? BoxDecoration(
                              color: FOREGROUND_COLOR,
                            ) : BoxDecoration(
                              color: FOREGROUND_COLOR.withOpacity(0.3),),
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white),),
                            ),
                          )
                      ),)
                )
            )
    );
  }


  _submit() async {
    Navigator.pushNamed(_ctx, '/');
  }

}