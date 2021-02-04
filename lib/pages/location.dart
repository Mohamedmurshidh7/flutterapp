import 'package:flutter/material.dart';

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Choose a location'),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
      ),
      body : Text('choose location'),
    );
  }
}
