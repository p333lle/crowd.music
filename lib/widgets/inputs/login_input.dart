import 'package:flutter/material.dart';
import 'package:crowd_music/utils/colors.dart';


class LoginInput extends StatefulWidget {
  final stream;
  final onChanged;
  final labelText;
  final obscureText;
  final controller;
  final inputFormatters;

  const LoginInput({Key key, this.stream, this.onChanged, this.labelText, this.obscureText, this.controller, this.inputFormatters}) : super(key: key);

  _LoginInput createState() => _LoginInput();
}

class _LoginInput extends State<LoginInput> {

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: StreamBuilder(
          stream: widget.stream,
          builder: (context, snapshot) {
            return TextField(
                onChanged: widget.onChanged,
                obscureText: widget.obscureText != null ? widget.obscureText : false,
                inputFormatters: widget.inputFormatters != null ? widget.inputFormatters : [],
                controller: widget.controller != null ? widget.controller : null,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  errorText: snapshot.error,
                  labelStyle: TextStyle(color: FOREGROUND_COLOR),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(width: 3.0, color: FOREGROUND_COLOR)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: DARKBACKGROUND_COLOR,
                      width: 1.0,
                    ),
                  ),
                ));
          }
      ),
    );
  }

}