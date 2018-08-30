import 'package:flutter/material.dart';
import 'PassScreen.dart';
import 'package:flutter/services.dart';

//-------------------------------------------------- LOGIN PAGE (USERNAME ENTRY) --------------------------------------------------------

//text editing controller to store username
TextEditingController username = new TextEditingController();

//-------------------------------------------------- LOGIN CLASS ---------------------------------------------------
class LoginPage extends StatefulWidget {
  LoginPage(){username.clear();}

  @override
  _LoginPageState createState() => new _LoginPageState();
}

//----------------------------state class for login-----------------------------------------------------
class _LoginPageState extends State<LoginPage> {

  _LoginPageState(){
    username.clear();
  }
  @override
  //widget for the UI- design
  Widget build(BuildContext context) {
    // ladscape orientation restriction
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    //logo widget
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('Images/imageedit_26_8716278705.png'),
      ),
    );
    //username widget
    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      textAlign: TextAlign.center,
      style: new TextStyle(fontSize: 25.0,color:  Colors.black),
      controller: username ,
      decoration: InputDecoration(
        hintText: 'Username',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    //go button widget
    final loginButton =  Material(
    borderRadius: BorderRadius.circular(20.0),
    shadowColor:  Color(0xFFFFFFFF),
    elevation: 0.0,
    child: MaterialButton(
                          minWidth: 200.0,
                          height: 48.0,
                          onPressed: ()=> goButton() ,
                          color: Color(0xFFFFFFFF),
                          child: Text('Go', style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black)),
                        ),
      );

    // Scaffold to hold the above mentioned buttons
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

  // adding functionality to go button
  void goButton(){
    if(username.text== '') {} else { Navigator.push(context, MaterialPageRoute(builder: (context) => Pass(username.text)));}
  }
}
//----------------------------------------------------------------------------------------------------------------------------