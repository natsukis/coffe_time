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

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.00,
                ),
                TextFormField(
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
                  obscureText: true,
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
                    _auth.signInAnon();
                  },
                ),
              ],
            ),
          )),
    );
  }
}
