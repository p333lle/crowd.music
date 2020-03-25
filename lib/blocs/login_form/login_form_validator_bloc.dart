import 'dart:async';
import 'package:crowd_music/blocs/login_form/login_form_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormValidatorBloc extends Object with LoginFormValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (u,p) => true);

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}