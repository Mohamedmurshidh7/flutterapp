import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';
class dlogin extends StatefulWidget {
  @override
  _dloginState createState() => _dloginState();
}

class _dloginState extends State<dlogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Logform(),
      ),
    );
  }
}
class Logform extends StatefulWidget {
  @override
  _LogformState createState() => _LogformState();
}

class _LogformState extends State<Logform> {
  final Authservice _auth = Authservice();
  final formkey = GlobalKey<FormState>();
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
        child : SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/images/docicon.png',
              height: 150 ),

              SizedBox(height: 20,),
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  onChanged: (val){
                    setState(() => email = val);
                  },
                  validator: (value) {
                    if(value.isEmpty)
                    {
                      return 'Enter a valid mail ID';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (val){
                    setState(() => password = val);
                  },
                  validator: (value) {
                    if(value.isEmpty)
                    {
                      return 'Enter a valid password';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  onPressed: () async  {
                    /*dynamic result = await _auth.Signinanon();
                    if(result==null){
                     print('error');
                    }
                    else {
                      print(result);
                    }
                    Navigator.pushNamed(context, '/');*/
                    if(formkey.currentState.validate()) {
                      dynamic result = await _auth.signInwithEmail(email, password);
                      if(result==null)
                        {
                          print('error');
                        }
                      else
                        {
                          print(result);
                          Navigator.pushNamed(context, '/');
                        }
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


            ],
          ),
        )
    );
  }
}
