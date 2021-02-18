import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/patlogin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin=true;
  void toggle(){
    setState(() => showSignin = !showSignin);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignin)
      {
        return plogin(toggle: toggle);
      }
    else
      {
        return Home(toggle: toggle);
      }

  }
}
