import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lxnavigator/src/models/user.dart';

class DatabaseService{

   final String uid;


  DatabaseService({this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String email, String role) async {
     return await userCollection.document(uid).setData({
       'uid' : uid,
       'email': email,
       'role' : role,

     });
   }
 }


