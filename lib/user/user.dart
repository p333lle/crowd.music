import 'package:crowd_music/utils//db_helper.dart';
import 'dart:async';


class User {

  String username;
  String token;

  User({this.username, this.token});
  User.map(dynamic obj) {
    this.username = obj["u_uid"];
    this.token = obj["u_token"];                                                   //TODO: u_session doesnt exist yet
  }

  String get getUsername => username;

  String get getToken => token;





  Map<String, dynamic> createSession() {
    var map = new Map<String, dynamic>();
    map["u_uid"] = username;              //maps user attributes to store as Session in Database
    map["u_token"] = token;


    return map;
  }



}


class UserProvider {

  var _userFetcher = UserFetcher();

  final _userFetcherController = StreamController<List<dynamic>>();

  get users => _userFetcherController.stream;

  UserProvider() {
    getUserData();
  }

  getUserData() async {

    var userDetails = await _userFetcher.users;
    final _users = List<User>.generate(
        userDetails.length,
            (i) => User(username: userDetails[i]["u_uid"], token: userDetails[i]["u_token"])
    );// = await _userFetcher.users;

    _userFetcherController.sink.add(_users);
  }

  dispose() {
    _userFetcherController.close();
  }
}




class UserFetcher {

  final db = new DatabaseHelper();

  Future<List<dynamic>> get users => db.getUserData();

}