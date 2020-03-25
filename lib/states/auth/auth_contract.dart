import 'package:crowd_music/states/auth/auth_state.dart';

abstract class AuthContract implements AuthStateListener{
  initState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }
}