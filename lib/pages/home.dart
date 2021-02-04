
import 'package:flutter/material.dart';





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medlife'),
        backgroundColor: Colors.lightGreen,
      ),
        body : MyForm(),
    );
  }
}
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:formKey,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
            validator: (value) {
              if(value.isEmpty)
                {
                 return "enter a valid Name";
                }
              return null;
            },
          ),
          
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.mail),
              hintText: 'Enter your Mail Id',
              labelText: 'Email',
            ),
            validator: (value) {
              if(value.isEmpty)
              {
                return "enter a valid Mail id";
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              icon: const Icon(Icons.keyboard),
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
            validator: (value) {
              if(value.isEmpty)
              {
                return "enter a valid password";
              }
              return null;
            },
          ),new Container(
              padding: const EdgeInsets.only(left: 150.0,top:30.0),
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(  ' Data is in processing.')));
                  }
                },
              ),
          ),
        ],
      ),
    );
  }
}

