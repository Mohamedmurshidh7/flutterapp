
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
        title: Text('Medlife',style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
        body : MyForm(),
    );
  }
}
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

enum gender {male , female}
class _MyFormState extends State<MyForm> {
  gender g = gender.male;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:formKey,
      child : Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

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
              SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

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
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

                  labelText: 'Password',
                ),
                validator: (value) {
                  if(value.isEmpty)
                  {
                    return "enter a valid password";
                  }
                  return null;
                },

              ),
              SizedBox(height: 20,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Gender :' , style: TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                     ),
                     ),
                     Radio(value: gender.male, groupValue: g, onChanged: null,),
                     const Text('Male', style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.black,
                     ),),
                     SizedBox(width: 20,),
                     Radio(value: gender.female, groupValue: g, onChanged: null,),
                     const Text('Female' , style: TextStyle(
                         fontSize: 20.0,
                         color: Colors.black,
                     ),
                     ),
                   ],
                 ),

              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: FlatButton(onPressed: () {
                  if (formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(  ' Data is in processing.')));
                  }
                },
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black,
                    child: Text('Submit', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

