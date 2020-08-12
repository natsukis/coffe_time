import 'package:coffe_time/models/brew.dart';
import 'package:coffe_time/screens/home/brew_list.dart';
import 'package:coffe_time/screens/home/setting_form.dart';
import 'package:coffe_time/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffe_time/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text('Coffe Time'),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Logout')),
              FlatButton.icon(
                  onPressed: () {
                    _showSettingPanel();
                  },
                  icon: Icon(Icons.settings),
                  label: Text('settings')),
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/coffee_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BrewList())),
    );
  }
}
