import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';
import 'package:flutterapp/sevices/database.dart';
import 'package:provider/provider.dart';
import 'phone.dart';

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
            width: double.infinity,
            color: Colors.black12,
            padding: EdgeInsets.all(15.0),
            child: FlatButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => phoneAuth()));
            },
                child: Text('Schiz Therapy',style: TextStyle(fontSize: 20.0))
            ),
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
        backgroundColor: Colors.green[500],
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
