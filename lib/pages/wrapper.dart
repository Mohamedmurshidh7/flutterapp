import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/authenticate.dart';
import 'package:flutterapp/pages/docHome.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/patHome.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    print(user);
    if(user==null)
      {
        return loading();
      }
    else {
      if(user.email=="mdmurshidh1@gmail.com")
        return dhome();
      else
        return pHome();
    }
  }
}
