import 'package:coffe_time/screens/shared/constant.dart';
import 'package:coffe_time/screens/shared/loading.dart';
import 'package:coffe_time/services/auth.dart';
import 'package:flutter/material.dart';

class SigniN extends StatefulWidget {
  final Function toogleView;
  SigniN({this.toogleView});

  @override
  _SigniNState createState() => _SigniNState();
}

class _SigniNState extends State<SigniN> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toogleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.00,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'), 
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.00,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'), 
                  obscureText: true,
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ char' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in with those credential';
                        });
                      }
                    }
                  },
                ),
                                SizedBox(height: 12,),
                Text(error, style: TextStyle(color: Colors.red),),
              ],
            ),
          )),
    );
  }
}
