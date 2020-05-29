import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(
      (FirebaseUser user) => _userFromFirebaseUser(user)
    );
  }

  // Sign in anon
  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // Sign in with username/password
  Future signInWithEmailAndPassword (String email, String password) async {
    try {

      AuthResult result = await _auth.signInWithEmailAndPassword(email : email, password : password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register
 Future registerWithEmailAndPassword(String email,String password,String name,String phone,String homeLocation) async{
   try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    // create a new database for user with uid
    await DatabaseService(uid:user.uid).updateUserData(name,email,phone,homeLocation);
    return _userFromFirebaseUser(user);
   }
   catch(e){
print((e.toString()));
return null;
   }
 }

  

  // Logout
  Future SignOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
  
}