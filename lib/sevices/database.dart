import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/patient.dart';
class DatabaseService
{
  final CollectionReference ptable = Firestore.instance.collection('patients');
  final String uid;

  DatabaseService({this.uid});

  Future updateUser(String Name ,String email ,String pwd ) async {
      return await  ptable.document(uid).setData({
        'name':Name,
        'email' : email,
        'password' : pwd,
      });
  }
  List<Patient> patlistfromsnap(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Patient(
        name: doc.data['name']??'',
        email : doc.data['email']??'',
        password : doc.data['password']??''
      );
    }).toList();
  }

  Stream<List<Patient>> get pat
  {
    return ptable.snapshots().map(patlistfromsnap);
  }
}