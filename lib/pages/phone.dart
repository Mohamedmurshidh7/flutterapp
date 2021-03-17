import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class phoneAuth extends StatelessWidget {
  final phonecontroller = TextEditingController();
  final _codecontroller = TextEditingController();
  Future<bool> loginPhone(String phone,BuildContext context) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential cred) async
        {
          AuthResult res = await auth.signInWithCredential(cred);
          FirebaseUser user  = res.user;
          if(user!=null)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Center(
                child: Text('njoy the therapy'),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Center(
                              child: Text('njoy the therapy'),
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
              Text('Login',style: TextStyle(
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
