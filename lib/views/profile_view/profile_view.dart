import 'package:crowd_music/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';



class ProfileView extends StatefulWidget {

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: FOREGROUND_COLOR),
        title: Text(
          'Drake',
          style: TextStyle(color: FOREGROUND_COLOR),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => print('LIked'),
              child: Icon(Icons.check,color: FOREGROUND_COLOR,),
            ),
          )
        ],
      ),
      body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                  height: 250,
                  child: profileVideo()
              ),
              ListView(
                children: <Widget>[
                  Divider(
                    height: 150,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 75),
                        decoration: BoxDecoration(
                          color: BACKGROUND_COLOR,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Divider(height: 90,),
                            profileCats(),
                            Song(),
                            Song(),
                            Song(),
                            Song(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: profilePicture(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileVideo() {
    return Container(
      child: Image.asset('giphy.gif',fit: BoxFit.fitHeight,),
    );
  }

  Widget profilePicture() {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: FOREGROUND_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        child: Container(
          width: 175,
          child: Image.network(
              'https://www.rapblokk.com/wp-content/uploads/2018/10/travis-scott-drake-sicko-mode-video.png',
              fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

  /*Widget profileButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
                side: BorderSide(color: FOREGROUND_COLOR)),
            child: Row(
              children: <Widget>[
                Text(
                  'Following',
                  style: TextStyle(color: FOREGROUND_COLOR),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(Icons.check, color: FOREGROUND_COLOR)
              ],
            )),
        SizedBox(
          width: 30,
        ),
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
                side: BorderSide(color: FOREGROUND_COLOR)),
            child: Row(
              children: <Widget>[
                Text(
                  'Message',
                  style: TextStyle(color: FOREGROUND_COLOR),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(Icons.chat_bubble_outline, color: FOREGROUND_COLOR)
              ],
            ))
      ],
    );
  }*/

  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Liked", style: TextStyle(color: Colors.white),),
    1: Text("Songs", style: TextStyle(color: Colors.white),),
    2: Text("Playlists", style: TextStyle(color: Colors.white),),
  };

  int segmentedControlGroupValue = 0;

  Widget profileCats() {
    return CupertinoSlidingSegmentedControl(
      backgroundColor: Colors.black,
      thumbColor: FOREGROUND_COLOR,
      groupValue: segmentedControlGroupValue,
      children: myTabs,
      onValueChanged: (i){
        setState(() {
          segmentedControlGroupValue = i;
        });
      },
    );
  }

  Widget Song() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(20.0),
          color: DARKBACKGROUND_COLOR),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                child: Text(
                  '5 hours ago',
                  style: TextStyle(
                      color: EVENDARKERTEXT_COLOR,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '3457',
                        style: TextStyle(
                            color: EVENDARKERTEXT_COLOR,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2,),
                      Icon(Icons.error_outline, color: Colors.red, size: 12,)
                    ],
                  )
              )
            ],
          ),
          Divider(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: Image.network(
                    'https://dervinylist.files.wordpress.com/2018/07/drake-scorpion-album-cover-cms-source.jpg'),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sicko Mode',
                      style: TextStyle(color: FOREGROUND_COLOR),
                    ),
                    Text(
                      'Drake feat Travis Scott',
                      style: TextStyle(color: DARKTEXT_COLOR),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


