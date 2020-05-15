import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'package:ecommerce/pages/home.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
 SignUp({this.toggleView});
  @override
  __SignUpState createState() => __SignUpState();
}

class __SignUpState extends State<SignUp> {
  //UserServices _userServices=  UserServices();
  //final FirebaseAuth firebaseAuth=  FirebaseAuth.instance;
  
     final AuthService _auth=  AuthService();
     final _formKey =GlobalKey<FormState>();
  // TextEditingController _emailTextController= TextEditingController();
  //  TextEditingController _passwordTextController= TextEditingController();
  //  TextEditingController _confirmpasswordTextController= TextEditingController();
  //   TextEditingController _nameTextController= TextEditingController();
  String gender;
  String groupValue="male";
  SharedPreferences preferences;
  bool loading =false;
  //bool isLoggedin = false;
  bool invisible = true;
  // void isSignedIn()async{
  // setState(() {
  //   loading=true;
  // });
  //preferences = await SharedPreferences.getInstance(); 
//  isLoggedin = await googleSignIn.isSignedIn();

//if(isLoggedin){
 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
//}

// setState(() {
//   loading=false;
// });

// }
// void initState() {
//     invisible = true;
//     super.initState();
// }
String error='';
String  name='';
String  email='';
String  password='';
String  confirmPassword='';

  
   @override
  Widget build(BuildContext context) {
    return loading ? Loading () :Scaffold(
     

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
                        child: Padding(
                           padding: const EdgeInsets.only(left:12.0),
                             child:
                             TextFormField(
                            //   controller: _nameTextController,
                             onChanged: (val){
                               setState(() => name = val );

                             },
                               decoration:InputDecoration(
                                hintText: "Full names",
                                icon: Icon(Icons.person_outline),
                                 border: InputBorder.none,
                                           ),
                                           
                        validator:(value){
                        if(value.isEmpty){
                          return "The name field cannot be empty";
                        }
                            return null;
                          }, 
                        
                            ),
                  ),
                    //padding
              ),//material
                    ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                         borderRadius:BorderRadius.circular(12.0),
                         color:Colors.white.withOpacity(0.8),
                         elevation:0.0,
                           child:Padding(
                         padding: const EdgeInsets.only(left:12.0),
                           child: TextFormField(
                            // controller: _emailTextController,
                              onChanged: (val){
                               setState(() => email = val );

                             },
                             decoration:InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.alternate_email),
                               border: InputBorder.none,            ),
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
                  ),
                
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                         borderRadius:BorderRadius.circular(12.0),
                         color:Colors.white.withOpacity(0.8),
                         elevation:0.0,
                        
                  child: Padding(
                           padding: const EdgeInsets.only(left:12.0),
                           // child: ListTile(
                               child: TextFormField(
                                // controller: _passwordTextController,
                               onChanged: (val){
                               setState(() => password = val );

                             },
                                 obscureText: invisible,
                                 decoration:InputDecoration(
                                  hintText: " Password",
                                 icon: Icon(Icons.lock_outline),
                                   border: InputBorder.none,   
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
                                )      )    ,        
                        validator:(value){
                        if(value.isEmpty){
                          return "The password cannot be empty";
                        }else if(value.length<6){
                           return "The Pasword has to be atleast 6 character long";
                        }
                            return null;
                          },


  

                        
                         // ),
                      //    trailing: IconButton(icon:Icon(Icons.remove_red_eye), onPressed: (){}),
                             
                  ),
                        ),
                      ),
                        ),
              
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                         borderRadius:BorderRadius.circular(12.0),
                         color:Colors.white.withOpacity(0.8),
                         elevation:0.0,
                        
                  child: Padding(
                           padding: const EdgeInsets.only(left:12.0),
                             child:  TextFormField(
                                // controller: _confirmpasswordTextController,
                              onChanged: (val){
                               setState(() => confirmPassword = val );

                             },
                                obscureText: invisible,
                                 decoration:InputDecoration(
                                  hintText: " Confirm Password",
                                  icon: Icon(Icons.lock_open),
                                    border: InputBorder.none,       
                                    
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
                       _formKey.currentState.validate();
                        if(value.isEmpty){
                          return "The password field cannot be empty";
                        }else if(value.length<6){
                          return "The password has to be atleast 6 characters long";
                        }else if(confirmPassword !=password){
                          return "the passwords do not match";
                        }
                            return null;
                          },
                             
                            ),
                            
                        //    trailing: IconButton(icon:Icon(Icons.remove_red_eye), onPressed: (){}),
                             ),
                  ),
                        
                      ),
                      SizedBox(height:12.0),
                      Text(error,
                      style:TextStyle(color: Colors.red, fontSize:14),),
              
              //  Padding(
              //           padding: const EdgeInsets.all(8.0),
              //      child: Container(
              //        color: Colors.white,
              //        child: Row(
              //          children: <Widget>[
              //         Expanded(child: ListTile(
              //           title: Text("male",
              //           style: TextStyle(color:Colors.black),),
              //            trailing:Radio(
              //          value: "male", groupValue: groupValue, onChanged: (e)=> ValueChanged(e))),),
                      

              //         Expanded(child: ListTile(
              //           title: Text("female",
              //            textAlign: TextAlign.end,
              //           style: TextStyle(color:Colors.black),),
              //            trailing:Radio(
              //              value: "female", groupValue: groupValue, onChanged: (e)=> ValueChanged(e))),),
                      
              //     ],),
              //      ),
              //  ),

          Padding(
                           padding: const EdgeInsets.all(8.0),
                             child: Material(
                               borderRadius: BorderRadius.circular(20.0),
                               color: Colors.teal[800],
                               elevation: 0.0,
                               child: MaterialButton(
                                 onPressed: () async{
                                  // validateForm();
                                  if(_formKey.currentState.validate()){
                                setState(() {
                               loading = true;
                                    });
                                    dynamic result = await _auth.registerWithEmailAndPassword(name,email,password,confirmPassword);
                                    if(result ==null){
                                      setState(() => error="please supply a valid email");
                                        loading = false;
                                       }
                                      

                                  }
                                                                    },
                                                                    minWidth:MediaQuery.of(context).size.width ,
                                                                  child: Text(
                                                                "Register",
                                                               textAlign: TextAlign.center,
                                                               style:TextStyle(
                                                                 color: Colors.white,
                                                               fontWeight: FontWeight.bold,
                                                               fontSize:18.0
                                                               ),
                                                               
                                                                  ), ),
                                                    
                                                           ),
                                                     ),
                                    
                                                    
                                                    //Divider(color: Colors.white,),
                                                   
                                                             Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                     child :InkWell(
                                                       onTap:(){
                                                         widget.toggleView();
                                                       },
                                                       child:Text("Login", 
                                                       textAlign:TextAlign.center,
                                                       style:TextStyle(color:Colors.blue,
                                                       fontWeight: FontWeight.bold
                                                        ))
                                                     )),
                                   
                                                     //            Expanded(child: Container(
                                                      // )),
                                                     //  SizedBox(
                                                     //    height:70.0,
                                                     //  ),
                                                      
                                                     //  Divider(color: Colors.white,),
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
                                     
                                         
                                          // Visibility(
                                          //   visible: loading ?? true,
                                          //   child: Container(
                                          //     alignment:Alignment.center,
                                          //     color:Colors.white.withOpacity(0.9),
                                          //     child: CircularProgressIndicator(
                                          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                                          //     ),
                                          //   )
                                          // )
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
                                  //    ValueChanged(e){
                                  //   setState((){
                                  //   if(e == "male"){
                                  //     groupValue = e;
                                  //     gender=e;
                                  //   }
                                  //  else if(e == "female"){
                                  //    groupValue =e;
                                  //    gender=e;
                                  //  }
                                  //  }
                                  //  );
                                  //  }
                                   
                              
                                      }

