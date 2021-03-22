import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/sevices/auth.dart';
import 'package:flutterapp/sevices/database.dart';
class phoneAuth extends StatefulWidget {
  @override
  _phoneAuthState createState() => _phoneAuthState();
}

class _phoneAuthState extends State<phoneAuth> {
  Authservice auth = Authservice();

  String phone;

  final phonecontroller = TextEditingController();

  final _codecontroller = TextEditingController();

  void initState(){
    getPhoneNum();
    super.initState();
  }


  getPhoneNum() async{
    QuerySnapshot snap = await auth.getCurrentUser();
    //print(snap.documents[0].data['showTherapy']);
    setState(() {
      phone = snap.documents[0].data['phoneNumber'];
    });

  }

  Future<bool> loginPhone(String phone,BuildContext context) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential cred) async
        {
          AuthResult res = await auth.signInWithCredential(cred);
          FirebaseUser user  = res.user;
          if(user!=null)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Center(
                child: Text('Enjoy the therapy',style: TextStyle(fontSize: 25.0)),
              )));
            }
        },
        verificationFailed:(AuthException ex)
        {
          print(ex.message);
        },
        codeSent: (String verificationId,[int forceResendingToken])
        {
          showDialog(context: context,
          barrierDismissible: false,
          builder: (context) {
                return AlertDialog(
                  title: Text('enter the code '),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _codecontroller,
                      ),
                    ],
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () async {
                        final code = _codecontroller.text.trim();
                        AuthCredential cred = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);
                        AuthResult res = await auth.signInWithCredential(cred);
                        FirebaseUser user  = res.user;
                        if(res!=null)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
                              body: Center(
                                child: Text('Enjoy the therapy',style: TextStyle(fontSize: 25.0)),
                              ),
                            )));
                          }
                        else
                          {
                            print('error');
                          }
                      },
                      child: Text('confirm'),
                    )
                  ],
                );
              },
          );
        },
        codeAutoRetrievalTimeout: null);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$phone',style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                ),
                controller : phonecontroller,
              ),
              SizedBox(height: 20.0),
              FlatButton(onPressed: (){
                final phonenum=  phonecontroller.text.trim();
                loginPhone(phonenum, context);
              },
                color: Colors.blue,
                padding: EdgeInsets.all(20.0),
                  child: Text('Login using phone',style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                  ),



              )

            ],
          ),
        ),
      ),
    );
  }
}
