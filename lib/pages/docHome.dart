import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/patient.dart';
import 'package:flutterapp/sevices/auth.dart';
import 'package:flutterapp/sevices/database.dart';
import 'package:provider/provider.dart';
import 'patList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/patient.dart';
import 'docdrawer.dart';
class dhome extends StatefulWidget {
  @override
  _dhomeState createState() => _dhomeState();
}

class _dhomeState extends State<dhome> {

  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Patient>>.value(
      value: DatabaseService().pat,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: Text('docHome'),
          actions: [
            FlatButton.icon(onPressed:() async {
              return await _auth.Signout();
            },
                icon: Icon(Icons.person),
                label: Text('Log out'),
            )
          ],
        ),
        drawer: Docdrawer(),
        body:PatList(),

      ),
    );
  }
}
