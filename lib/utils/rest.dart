import 'dart:async';

import 'package:crowd_music/utils/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://beat-donations.com/buckhorn/api/user/";
  static final LOGIN_URL = BASE_URL + "/login.php";

  Future<User> login(String username, String password) async {
    return _netUtil.post(LOGIN_URL, body: {
      //"fcmtoken": await FirebaseMessaging().getToken(),
      "uid": username,
      "pwd": password,

    }).then((dynamic res) {
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}