
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
      routes:{
      '/' : (context) => loading(),
        '/home' : (context) => Home(),
        '/location' : (context) => location(),
      },
  ));
}

class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int count = 0 ;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text('Doctor'),
        centerTitle: true ,
        backgroundColor: Colors.lightGreen[700],
      ),
      body: Center(
        child: Text('$count',
          style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2.0,
        ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count+=2;
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        backgroundColor: Colors.lightGreen[700],
      ),
    );
  }
}
