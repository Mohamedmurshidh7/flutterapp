import 'package:flutter/material.dart';

class plogin extends StatefulWidget {
  @override
  _ploginState createState() => _ploginState();
}

class _ploginState extends State<plogin> {
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
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
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
                }
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
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
                onPressed: () {},
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
              Navigator.pushNamed(context, '/home');
            },
                child: Text('Sign up',
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
            )

          ],
        ),
      )
    );
  }
}
