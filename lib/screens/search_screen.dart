import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            //Todo: Create better UI for the search feature. Must access database correctly.
            Text('Search for a User/Post'),
            Container(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage('https://i.redd.it/dmdqlcdpjlwz.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
