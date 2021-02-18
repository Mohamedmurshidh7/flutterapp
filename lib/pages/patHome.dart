import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';

class pHome extends StatefulWidget {
  @override
  _pHomeState createState() => _pHomeState();
}

class _pHomeState extends State<pHome> {
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          FlatButton.icon(onPressed:() async {
          return await _auth.Signout();
          },
              icon: Icon(Icons.person
              ),
              label: Text('Log out'))
        ],
      ),
    );
  }
}
