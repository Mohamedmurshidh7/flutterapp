 import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/patient.dart';
import 'PatientTile.dart';
class PatList extends StatefulWidget {
  @override
  _PatListState createState() => _PatListState();
}

class _PatListState extends State<PatList> {

  @override
  Widget build(BuildContext context) {
    final pats = Provider.of<List<Patient>>(context);
    //print(pats.documents);
    // pats.forEach((pats) {
    //   print(pats.name);
    //   print(pats.email);
    //   print(pats.password);
    //
    // });
    return ListView.builder(
        itemCount: pats.length,
        itemBuilder: (context,index)
        {
         return patTile(pat:pats[index]);
        });
  }
}
