import 'package:flutter/material.dart';
import 'PassScreen.dart';
import 'dart:ui';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0,color:  Colors.black),
      decoration: InputDecoration(
        hintText: 'Username',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton =  Material(
    borderRadius: BorderRadius.circular(20.0),
    shadowColor:  Color(0xFFFFFFFF),
    elevation: 0.0,

    child: MaterialButton(
    minWidth: 200.0,
    height: 48.0,
    onPressed: () => runApp(new MaterialApp(home: Pass())),
    color: Color(0xFFFFFFFF),
    child: Text('Go', style: TextStyle(
    fontSize: 25.0,
    color: Colors.black)),
    ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF262A38),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}