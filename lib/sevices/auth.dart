import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/sevices/database.dart';
class Authservice{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }
   Future<QuerySnapshot> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    //print( uid);
    return await DatabaseService(uid: uid).getDoc();
  }
  //register with email and password
  Future Regwithemail(String name,String email,String password) async {
    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid : user.uid).updateUser(name, email, password);
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
  Future signInwithEmailDoc(String email,String password) async {
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
  Future UpdateDoc(String uid,bool showT) async
  {
    try{
      AuthResult res = await DatabaseService(uid: uid).updateDoc(showT);
      return res;
    }
    catch(e)
    {
      print('error');
    }
  }
}