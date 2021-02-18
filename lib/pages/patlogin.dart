import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';

class plogin extends StatefulWidget {
  final Function toggle;
  plogin({this.toggle});
  @override
  _ploginState createState() => _ploginState();
}

class _ploginState extends State<plogin> {
  final formkey = GlobalKey<FormState>();
  String email='';
  String password='';

  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:Form(
          key: formkey,
            child : SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/paticon.png',
                    height: 150,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                      validator: (value) {
                        if(value.isEmpty)
                        {
                          return 'Enter a valid mail ID';
                        }
                        return null;
                      },
                      onChanged: (val){setState(() => email = val);
                      },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if(value.length<6)
                        {
                          return 'Password must be greater than 6 characters';
                        }
                        return null;
                      },
                      onChanged: (val){setState(() => password = val);},
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.all(20.0),
                      onPressed: () async {
                        if(formkey.currentState.validate()){
                          dynamic result = await _auth.signInwithEmail(email, password);
                          if(result==null)
                          {
                            print('error');
                          }
                          Navigator.pushNamed(context, '/');
                        }
                      },
                      color: Colors.black,
                      child: Text('Log in', style: TextStyle(
                        color : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 200,),
                  FlatButton(
                    onPressed: () {
                      widget.toggle();
                      //Navigator.pushNamed(context, '/home');
                    },
                    child: Text('Sign up',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )

                ],
              ),
            ),
        ),
      ),
    );
  }
}
