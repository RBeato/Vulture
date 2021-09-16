import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Romeu Beato'),
            Text("UserName"),
            Text("Insert quote here"),
            Text("Tristans Tweets", style: TextStyle(fontSize: 15.0)),
            Text('#1 tweet'),
          ],
        ),
      ),
    );
  }
}
