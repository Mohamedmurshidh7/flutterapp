import 'package:flutter/material.dart';
import 'package:flutterapp/models/patient.dart';
class Details extends StatelessWidget {
  final Patient pat;
  Details({this.pat});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: Colors.green[500],
      ),
        body: SafeArea(
          child: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ${pat.name}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),
                SizedBox(height: 10.0),
                Text('Email : ${pat.email}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),),
                SizedBox(height: 10.0),
                Text('password : ${pat.password}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        )
    );
  }
}
