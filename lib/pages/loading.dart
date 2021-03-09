import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
         child: SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Are you a patient or doctor",style:  TextStyle(
               fontSize: 20.0,
             ),
             ),

             SizedBox(height: 10.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 FlatButton(
                     color: Colors.black,
                   padding: EdgeInsets.all(10.0),
                   child: Text('Patient', style: TextStyle(
                       fontWeight: FontWeight.bold,
                      color: Colors.white,
                     fontSize: 20,
                   )
                   ),
                     onPressed: () {
                          Navigator.pushNamed(context,'/login');
                     }

                 ),
                 SizedBox(width: 20.0,),
                 FlatButton(
                   onPressed: () {
                     Navigator.pushNamed(context,'/dlogin');
                   },
                   padding: EdgeInsets.all(10.0),
                   color: Colors.black,
                   child: Text('Doctor', style: TextStyle(
                     color : Colors.white,
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                   ),
                 ),
               ],
             )
           ],
           ),
         ),
      ),
    );
  }
}
