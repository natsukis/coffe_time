import 'package:coffe_time/services/auth.dart';
import 'package:flutter/material.dart';

class SigniN extends StatefulWidget {
  @override
  _SigniNState createState() => _SigniNState();
}

class _SigniNState extends State<SigniN> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20.00,),
            TextFormField(
              onChanged: (val){

            },
            ),
                        SizedBox(height: 20.00,),
            TextFormField(
              obscureText: true,
              onChanged: (val){

            },)
          ],),
          )
      ),
    );
  }
}