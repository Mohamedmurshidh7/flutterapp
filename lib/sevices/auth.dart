import 'package:firebase_auth/firebase_auth.dart';
class Authservice{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }
  //sign in anonymously
  Future Signinanon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }catch(e){
        print('error');
        return null;
    }
  }
  //signing out
  Future Signout() async {
    try{
      return await _auth.signOut();
    }catch(e)
    {
      print("error");
      return null;
    }
  }
  //register with email and password
  Future Regwithemail(String email,String password) async {
    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    catch(e)
    {
      print('error'+e.toString());
      return null;
    }
  }
//login with email and password
Future signInwithEmail(String email,String password) async {
  try{
    AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }
  catch(e)
  {
    print('error'+e.toString());
    return null;
  }
}
}