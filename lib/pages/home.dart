
import 'package:flutter/material.dart';
import 'package:flutterapp/sevices/auth.dart';

class Home extends StatefulWidget {
  final Function toggle;
  Home({this.toggle});
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
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggle();
          }, icon: Icon(Icons.person,color: Colors.white,), label: Text('Sign In',style: TextStyle(
            color: Colors.white
          ),
          ),
          ),
        ],
      ),
        body : MyForm(),
    );
  }
}
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}
enum lang{tamil,english,both}
enum gender {male , female}
class _MyFormState extends State<MyForm> {
  gender g = gender.male;
  lang l = lang.tamil;
  String email='';
  String password='';
  String error='';
  final formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice();
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
                onChanged: (val){
                  setState(() => email = val);
                },
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
                onChanged: (val){
                  setState(() => password = val);
                },
                validator: (value) {
                  if(value.length<6)
                  {
                    return "Password length must be greater than 6";
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
              Text('  Languages preferred :' , style: TextStyle(
                fontSize: 20.0,
                color:Colors.black,
              ),
              ),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(value: lang.tamil, groupValue: l, onChanged: null,),
                    const Text('Tamil', style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),),
                    SizedBox(width: 20,),
                    Radio(value: lang.english, groupValue: l, onChanged: null,),
                    const Text('English' , style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    ),
                    SizedBox(width: 20,),
                    Radio(value: lang.both, groupValue: l, onChanged: null,),
                    const Text('Both' , style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    ),
                  ],
              ),

              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: FlatButton(onPressed: () async {
                  if(formKey.currentState.validate())
                    {
                      dynamic result = await _auth.Regwithemail(email, password);
                      if(result==null)
                        {
                          print('error');
                        }
                      Navigator.pushNamed(context, '/');
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

