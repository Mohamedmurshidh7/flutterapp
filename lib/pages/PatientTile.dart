import 'package:flutter/material.dart';
import 'package:flutterapp/models/patient.dart';
import 'patdetails.dart';
class patTile extends StatefulWidget {
  final Patient pat;
  patTile({this.pat});

  @override
  _patTileState createState() => _patTileState();
}

class _patTileState extends State<patTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
    child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
       child: ListTile(
         leading: Icon(Icons.person),
         title: Text(widget.pat.name),
         subtitle: Text(widget.pat.email),
         onTap:(() {
    Navigator.push(context,
    MaterialPageRoute(
    builder: (_) => Details(pat: this.widget.pat)
    ),
    );
           }),
         ),
       ),
    );
  }
}



