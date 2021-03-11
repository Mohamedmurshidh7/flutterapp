import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';
import 'package:flutterapp/sevices/database.dart';
import 'package:provider/provider.dart';

class pHome extends StatefulWidget {
  @override
  _pHomeState createState() => _pHomeState();
}

class _pHomeState extends State<pHome> {
  final Authservice _auth = Authservice();
  var showTherapy;
  @override
  void initState(){
    getUser();
    super.initState();
  }

    getUser() async{

    QuerySnapshot snap = await _auth.getCurrentUser();
    print(snap.documents[0].data['showTherapy']);
    if(snap.documents[0].data['showTherapy']==true)
    {
      setState(() {
        showTherapy = true;
      });

    }
    else
    {
      setState(() {
        showTherapy = false;
      });

    }
  }
  @override
  Widget build(BuildContext context)  {

    Widget content()
    {
      //print('Inside fn ');
      if(showTherapy==true)
        {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Your therapy is available'),
          );
        }
      else
        {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No therapy is available'),
          );
        }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          FlatButton.icon(onPressed:() async {
          return await _auth.Signout();
          },
              icon: Icon(Icons.person
              ),
              label: Text('Log out')
          )

        ],
      ),
      body: content() ,
    );
  }
}
