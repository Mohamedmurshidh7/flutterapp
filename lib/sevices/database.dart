import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/patient.dart';
class DatabaseService
{
  final CollectionReference ptable = Firestore.instance.collection('patients');
  final String uid;

  DatabaseService({this.uid});

  Future updateUser(String Name ,String email ,String pwd,String phoneNumber) async {
      return await  ptable.document(uid).setData({
        'uid':uid,
        'name':Name,
        'email' : email,
        'password' : pwd,
        'showTherapy': false,
        'phoneNumber' : phoneNumber
      });
  }
  Future<QuerySnapshot> getDoc()
  {
    return ptable.where('uid',isEqualTo: uid).getDocuments();
  }
  Stream<QuerySnapshot> get userdet
  {
    return   ptable.where('uid',isEqualTo: uid).snapshots();
  }
  List<Patient> patlistfromsnap(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Patient(
        uid: doc.data['uid']??'',
        name: doc.data['name']??'',
        email : doc.data['email']??'',
        password : doc.data['password']??'',
        phoneNumber : doc.data['phoneNumber']??''
      );
    }).toList();
  }

  Stream<List<Patient>> get pat
  {
    return ptable.snapshots().map(patlistfromsnap);
  }
  Future updateDoc(bool showT) async {
    return await  ptable.document(uid).updateData({
      'showTherapy' : showT
    });
  }
  Future addData() async
  {
    return await ptable.document(uid).updateData({
      'uid' : uid,
      'showTherapy' : false
    }
    );
  }
}