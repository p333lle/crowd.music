import 'package:crowd_music/utils/colors.dart';
import 'package:flutter/material.dart';


class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: FOREGROUND_COLOR),
        title: Text(
          'Search',
          style: TextStyle(color: FOREGROUND_COLOR),
        ),
      ),
      body: ListView(
        children: <Widget>[
          TextFormField()
        ],
      ),
    );
  }
}