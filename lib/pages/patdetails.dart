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
    showConfirm()
    {
      showModalBottomSheet(context: (context),
          builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(

            children: [
              Text('Give Access to ${pat.name}' , style:
                TextStyle(
                  fontSize: 25.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold
                )
                ,),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed:() async {
                    dynamic result =await auth.UpdateDoc(pat.uid, true);
                    if(result==null)
                    {
                      print('error');
                    }
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('OK',style:
                      TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                  ),
                  ),
                    color: Colors.blue,
                  ),
                  SizedBox(width: 20.0),
                  RaisedButton(onPressed:()=>Navigator.pop(context),
                    child: Text('Cancel',style:
                    TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,

                    ),
                    ),
                    color: Colors.white24,
                  ),

                ],
              ),
            ],
          ),
        );
      });
    }

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
                Text('Mobile  : ${pat.phoneNumber}',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),),
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: ()=> showConfirm(),
                    /*dynamic result =await auth.UpdateDoc(pat.uid, true);
                    if(result==null)
                    {
                      print('error');
                    }*/
                    //Navigator.pushNamed(context, '/');
                    // Navigator.push(context,
                    //     MaterialPageRoute(
                    //     builder: (_) => dhome()
                    // ));

                 child: Text('Give access',style: TextStyle(
                   fontSize: 20.0,
                 ),
                 ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
