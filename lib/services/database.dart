import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // Collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');
  

  Future updateUserData(String name, String  email, String password, String confirmPassword ) async {
    return await userCollection.document(uid).setData({
   
      'name'  : name,
      'email': email,
      'password':password,
      'confirmPassword':confirmPassword,
    });
  }


  // user list from snapshot
//   List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc){
//       return User(
//         name: doc.data['name'] ?? '',
//         strength: doc.data['strength'] ?? 0,
//         sugars: doc.data['sugars'] ?? '0'
//       );
//     }).toList();
//   }

//   // Get brews stream
//   Stream<List<User>> get brews {
//     return userCollection.snapshots().map(_userListFromSnapshot);
//   }

//   UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//     return UserData(
//       uid: uid,
//       name: snapshot.data['name'],
//       sugars: snapshot.data['sugars'],
//       strength: snapshot.data['strength']
//     );
//   }

//   // Get user document
//   Stream<UserData> get userData {
//     return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
//   }

}