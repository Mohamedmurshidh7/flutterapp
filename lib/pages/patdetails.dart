import 'package:flutter/material.dart';
import 'package:flutterapp/models/patient.dart';
import 'package:flutterapp/pages/docHome.dart';
import 'package:flutterapp/sevices/database.dart';
import 'package:flutterapp/sevices/auth.dart';
class Details extends StatelessWidget {
  final Authservice auth = Authservice();
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
                RaisedButton(
                  onPressed: () async{
                    dynamic result =await auth.UpdateDoc(pat.uid, true);
                    if(result==null)
                    {
                      print('error');
                    }
                    Navigator.pushNamed(context, '/');
                    // Navigator.push(context,
                    //     MaterialPageRoute(
                    //     builder: (_) => dhome()
                    // ));
                  },
                 child: Text('Give access',style: TextStyle(
                   fontSize: 20.0,
                 ),
                 ),
                )

              ],
            ),
          ),
        )
    );
  }
}
