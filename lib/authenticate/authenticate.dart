import 'package:ecommerce/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() =>showSignIn =!showSignIn);
  }
  @override
  Widget build(BuildContext context) {
     if (showSignIn){
       return Login(toggleView: toggleView);
     }else{
       return SignUp(toggleView : toggleView);
     }
  }
}