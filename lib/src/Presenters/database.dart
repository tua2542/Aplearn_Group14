import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lxnavigator/src/models/user.dart';

class DatabaseService{

   final String uid;


  DatabaseService({this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String email, String firstname , String lastname , String occupation) async {
     return await userCollection.document(uid).setData({
       'uid' : uid,
       'email': email,
       'firstname': firstname,
       'lastname': lastname,
       'occupation': occupation,
     });
   }

//user from snapshot
// List<User> _userListFromSnapshot(QuerySnapshot snapshot){
//   return snapshot.documents.map((doc){
//     return User(
//       email: doc.data['email'] ?? '',
//       firstname: doc.data['firstname'] ?? '',
//       lastname: doc.data['lastname'] ?? '',
//       occupation: doc.data['occupation'] ?? '',

//     );
//   }).toList();
// }

// get user streams
// Stream<List<User>> get users {
//   return userCollection.snapshots()
//   .map(_userListFromSnapshot);
// }

 }