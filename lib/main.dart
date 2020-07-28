import 'package:coffe_time/models/user.dart';
import 'package:coffe_time/screens/wrapper.dart';
import 'package:coffe_time/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
       home: Wrapper(),
      ),
    );
  }
}