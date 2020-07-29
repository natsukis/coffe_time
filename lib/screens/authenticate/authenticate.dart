import 'package:coffe_time/screens/authenticate/register.dart';
import 'package:coffe_time/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

bool showSignIn = true;

void toogleView(){
  setState(() {
    showSignIn = !showSignIn;
  });
}

  @override
  Widget build(BuildContext context) {
       if (showSignIn) {
        return SigniN(toogleView : toogleView);
      }else{
        return Register(toogleView : toogleView);
      }
  }
}