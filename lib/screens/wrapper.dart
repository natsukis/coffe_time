import 'package:coffe_time/models/user.dart';
import 'package:coffe_time/screens/authenticate/authenticate.dart';
import 'package:coffe_time/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final user = Provider.of<User>(context); 

    // return either home or authenticate
    if (user == null) {
          return Authenticate();
    } else {
          return Home();
    }

  }
}