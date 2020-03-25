import 'package:crowd_music/db/Database.dart';
import 'dart:async';


class User {

  String username;
  String first;
  String last;
  int classNum;
  String classLet;

  String token;
  int loggedIn;
  String profilePic;

  User({this.username, this.first, this.last, this.classNum, this.classLet, this.token, this.loggedIn});

  User.map(dynamic obj) {
    this.username = obj["u_uid"];
    this.first = obj["u_first"];
    this.last = obj["u_last"];
    this.classNum = obj["u_class_num"];
    this.classLet = obj["u_class_let"];
    this.token = obj["u_token"];                                                   //TODO: u_session doesnt exist yet
  }

  String get getUsername => username;

  String get getFirst => first;

  String get getLast => last;

  int get getClassNum => classNum;

  String get getClassLet => classLet;

  String get getToken => token;

  int get getLoggedIn => loggedIn;

  String get getProfilePic => profilePic;




  Map<String, dynamic> createSession() {
    var map = new Map<String, dynamic>();
    map["u_uid"] = username;              //maps user attributes to store as Session in Database
    map["u_first"] = first;
    map["u_last"] = last;
    map["u_classNum"] = classNum;
    map["u_classLet"] = classLet;
    map["u_loggedin"] = 1;
    map["u_token"] = token;
    map["u_profilepic"] = profilePic;


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
            (i) => User(username: userDetails[i]["u_uid"], first: userDetails[i]["u_first"], last: userDetails[i]["u_last"], classNum: userDetails[i]["u_classNum"], classLet: userDetails[i]["u_classLet"] ,token: userDetails[i]["u_token"], loggedIn: userDetails[i]["u_loggedin"])
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