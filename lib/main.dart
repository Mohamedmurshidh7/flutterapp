
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/authenticate.dart';
import 'package:flutterapp/pages/wrapper.dart';
import 'package:flutterapp/sevices/auth.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/patlogin.dart';
import 'pages/doclogin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value:Authservice().user,
      child: MaterialApp(
        initialRoute: '/',
        routes:{
          '/' : (context) => Wrapper(),
          '/home' : (context) => Home(),
          '/login' : (context) => Authenticate(),
          '/dlogin' : (context) => dlogin(),
        },
      ),
    );
  }
}

/*class Home1 extends StatefulWidget {
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

 */
