import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/authenticate/authenticate.dart';


class Login extends StatefulWidget {
 final Function toggleView;
 Login({this.toggleView});
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  
  //creating variables
  // final GoogleSignIn googleSignIn= new GoogleSignIn();
   final AuthService _auth=  AuthService();
  final _formKey =GlobalKey<FormState>();
  //TextEditingController _emailTextController= TextEditingController();
   //TextEditingController _passwordTextController= TextEditingController();
  String email='';
 String password='';
  //SharedPreferences preferences;
  bool loading =false;
   bool invisible = true;
  //bool isLoggedin = false;
String error='';

//calling the initial state
@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   isSignedIn();
  //   invisible = true;
  // }

// void isSignedIn()async{
//   setState(() {
//     loading=true;
//   });
//   preferences = await SharedPreferences.getInstance(); 
//   //isLoggedin = await googleSignIn.isSignedIn();

// if(isLoggedin){
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
// }

// setState(() {
//   loading=false;
// });

// }

//waiting for sth
// Future handleSignIn() async{
//   preferences = await SharedPreferences.getInstance();

//   setState(() {
//     loading=true;
//   });
 
  // GoogleSignInAccount googleUser= await googleSignIn.signIn();
  // GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   accessToken:googleSignInAuthentication.accessToken,
  //   idToken:googleSignInAuthentication.idToken,
  // );
 // FirebaseUser firebaseUser= (await firebaseAuth.signInWithCredential(credential)).user;
 // GoogleSignInAuthentication googleSignInAuthentication=await googleUser.authentication;
 //FirebaseUser firebaseUser= await firebaseAuth.signInWithGoogle(
  //  idToken:GoogleSignInAuthentication.idToken, accessToken:GoogleSignInAuthentication.accessToken);
//     if(firebaseUser != null){
//       final QuerySnapshot result = await Firestore.instance.collection("users").where("id", isEqualTo:firebaseUser.uid).getDocuments();
//       final List<DocumentSnapshot> documents = result.documents;
//       if(documents.length==0
//       ){
// //inserting the user to our collection
// Firestore.instance.collection("users").document(firebaseUser.uid).setData({
//   "id": firebaseUser.uid,
//   "Username":firebaseUser.displayName,
//   "profilePicture":firebaseUser.photoUrl

// }
// );

// await preferences.setString("id", firebaseUser.uid);
// await preferences.setString("username", firebaseUser.displayName);
// await preferences.setString("profilePicture", firebaseUser.photoUrl);


//       }else{
//         await preferences.setString("id", documents[0]["id"]);
//          await preferences.setString("username", documents[0]["username"]);
//           await preferences.setString("profilePicture", documents[0]["profilePicture"]);
//       }
//       Fluttertoast.showToast(msg: "Login was successful");
//       setState(() {
//         loading=false;
//       });
//       Navigator.pushReplacement(context, MaterialPageRoute(
//         builder: (context)=> HomePage()));

//     }
// }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading ():Scaffold(
      
     

      body: Stack(
      
        children:<Widget>[
      

       Container(
         color:Colors.white.withOpacity(0.8),
          width:double.infinity,
        height:double.infinity,
       ),
       Container(
         alignment:Alignment.topCenter,
         child:Image.asset("images/logo.png", width:280.0, height:240.0)
       ),


       Center(
         child: Padding(
           padding: const EdgeInsets.only(top:200.0),
           child: Center(
              child:Form(
                  key: _formKey,
                  child: ListView(
                   children: <Widget>[
                    
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                       borderRadius:BorderRadius.circular(12.0),
                       color:Colors.white.withOpacity(0.8),
                       elevation:0.0,
                       child:Padding(
                         padding: const EdgeInsets.only(left:12.0),
                           child: TextFormField(
                             onChanged: (val){
                               setState(() => email = val );

                             },
                             //controller: _emailTextController,
                             decoration:InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.alternate_email),
                                           ),
                      validator:(value){
                       Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                             RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                    return 'Please enter a Valid Email';
                                         else
                                                 return null;
                      }
                      ),
                  ),//padding
              ),//material
                    ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                         borderRadius:BorderRadius.circular(12.0),
                         color:Colors.white.withOpacity(0.8),
                         elevation:0.0,
                        
                  child: Padding(
                           padding: const EdgeInsets.only(left:12.0),
                             child: TextFormField(
                               onChanged: (val){
                               setState(() => password = val );
                             },
                             obscureText: invisible,
                               //controller: _passwordTextController,
                               decoration:InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                               suffixIcon: GestureDetector(
                                  onLongPress: () {
                                  setState(() {
                                   invisible =true;
                                         });},
                                 
                             onLongPressUp: () {
                                 setState(() {
                                   invisible= false;
                                       });
                                },
                               child: Icon(
                              invisible ? Icons.visibility : Icons.visibility_off),
                                )    ),
                        validator:(value){
                        if(value.isEmpty){
                          return "The password cannot be empty";
                        }else if(value.length<6){
                           return "The Pasword has to be atleast 6 character long";
                        }
                            return null;
                          }
                            ),
                  ),
                        ),
                      ),
                      SizedBox(height:12.0),
                      Text(error,
                      style:TextStyle(color: Colors.red, fontSize:14),),


          Padding(
                           padding: const EdgeInsets.all(8.0),
                             child: Material(
                               borderRadius: BorderRadius.circular(20.0),
                               color: Colors.teal[800],
                               elevation: 0.0,
                               child: MaterialButton(
                     onPressed: () async{ 
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword( email, password);
                      if (result == null) {
                        setState(() {
                          error = "Something went wrong!!";
                          loading = false;
                        });
                      }
                    }
                  },
                                 minWidth:MediaQuery.of(context).size.width ,
                               child: Text(
                             "Login",
                            textAlign: TextAlign.center,
                            style:TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:18.0
                            )
                               ), ),
                               
                               
                 
                        ),
                        
                  ),
                 SizedBox(height: 20,),
                Text(error,
                style: TextStyle(color : Colors.red),
                ),
                 //Divider(color: Colors.white,),
                       Padding
                       (padding: const EdgeInsets.all(8.0),
                       child: Text("Forgot Password",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color:Colors.black,
                         fontWeight:FontWeight.w400,
                       ),
                       
                       ),
                       
                       ),






                          Padding(
                           padding: const EdgeInsets.all(8.0),
                               child :InkWell(
                                  onTap:(){
                                    widget.toggleView();
                                  },
                                     child:Text("sign up",
                                     textAlign: TextAlign.center,
                                      style:TextStyle(color:Colors.blue,   fontWeight: FontWeight.bold ))
                                  )),


                  //            Expanded(child: Container(
                   // )),
                   SizedBox(
                     height:70.0,
                   ),
                   
                   Divider(color: Colors.white,),
                  //  Text("Other Login option",
                  //  textAlign:TextAlign.center,
                  //  style:TextStyle(color: Colors.black,
                  //  )
                  //  ),
                  //     Padding(
                  //          padding: const EdgeInsets.all(8.0),
                  //            child: Material(
                  //              borderRadius: BorderRadius.circular(20.0),
                  //              color: Colors.teal[800],
                  //              elevation: 0.0,
                  //              child: MaterialButton(
                  //                onPressed: (){
                  //                  handleSignIn();
                  //                },
                  //                minWidth:MediaQuery.of(context).size.width ,
                  //              child: Text(
                  //            "Sign in with google",
                  //           textAlign: TextAlign.center,
                  //           style:TextStyle(
                  //             color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18.0
                  //           )
                  //              ), ),
                 
                  //       ),
                  
                  //         ),
                      ],


                  )

              ),
            ),
         ),
       ),
  
      
       Visibility(
         visible: loading ?? true,
         child: Container(
           alignment:Alignment.center,
           color:Colors.white.withOpacity(0.9),
           child: CircularProgressIndicator(
             valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
           ),
         )
       )
        ]      ),
//   bottomNavigationBar:Container(
//     child:Padding(padding: const EdgeInsets.only(left:8.0, right:12.0,bottom:8.0),
//       child:FlatButton(onPressed:(){
//            handleSignIn();
//          } ,
//          color: Colors.teal,
//          child: Text("Sign in/up WITH GOOGLE"),),
// )
//   ) ,  
    );
  }
}