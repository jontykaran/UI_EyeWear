import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'Categories.dart';



List<String> finetic = ['alpha','bravo','charlie','delta','echo','foxtrot','golf','hotel',
                        'india','julliet','kilo','lima','mike','november','oscar','papa',
                        'quebec','romeo','sierra','tango','uniform','victor','whiskey','xray','yankee','zulu'];

List<String> pass=[];
TextEditingController controller = new TextEditingController();

class Pass extends StatefulWidget {
  //Custom constructor, add property : title

  String username;
  Pass(String username){
    this.username=username;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PassState(username);//Return a state object
  }
}

class PassState extends State<Pass> {

  String username ;
  PassState(String username) {
    this.username= username;
    url = "https://api.myjson.com/bins/18jz8g";
    loginDetail = [];
  }

  void initState() {
    super.initState();

    getFileDetails();
  }

// read json
  Future<Null> getFileDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        loginDetail.add(FileDetails.fromJson(user));
      }
    });
  }


  //State must have "build" => return Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF393D4D),
          title: new Text(
              'Login', textAlign: TextAlign.center, textScaleFactor: 1.2),
        ),
        body:
       new Container(
          color: Color(0xFF262A38),
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[


             new TextField(
               controller: controller,
               decoration: new InputDecoration(

               ),
               //decoration: new InputDecoration(
                //   hintText: 'Password', border: InputBorder.none ),
               //maxLengthEnforced: true,
               textAlign: TextAlign.center,
               style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35.0, color: Colors.white),

               //maxLength: 5,
               //onChanged: passcheck(controller.text),
               focusNode: new FocusNode(),
               cursorColor:  Colors.black,
             ),

             new FlatButton(onPressed: ()=> passcheck(controller.text),
                          child: new Text('Go', style: TextStyle(
                     fontSize: 20.0,
                     color: Color(0xFFCFCFD1)),textAlign: TextAlign.center,)),

            new Expanded(
                child:  new GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              shrinkWrap: true,

              childAspectRatio: 1.0,
              padding: const EdgeInsets.only(
                  left: 4.0, top: 4.0, right: 4.0, bottom: 4.0),
              children: _buildGridTiles(9), //Where is this function ?
            ))

           ],
         )

       )
      ,
        bottomNavigationBar: new BottomAppBar(
            color: Color(0xFF393D4D),

            child : new Row(
              children: <Widget>[
                SizedBox(width: 20.0,),
                new Image.asset( 'Images/imageedit_26_8716278705.png',fit: BoxFit.scaleDown,scale: 1.5,height: 60.0,width: 300.0,alignment: Alignment.centerLeft,)

              ],
            )

        )
    );
  }
/////////////////////////////////////////////////////////////////////////////////
 void passcheck(String text)  {
    //passwordDetail.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    else if(text.length==5){
      for(int i=0; i<= loginDetail.length; i++){
        if(loginDetail[i].user==username&&controller.text==loginDetail[i].passValue){
          runApp(new MaterialApp(
            home: Categories(),
          ));
        }
      }
      controller.clear();
    }
  }
////////////////////////////////////////////////////////////////////////////////
}

List<Widget> _buildGridTiles(numberOfTiles) {


 // List<String> Alphabet = randomAlpha().split('');
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        return new Container(
            //padding: EdgeInsets.all(10.0),
            //decoration: BoxDecoration(
             // color: Color(0xFF393D4D),
             // shape: BoxShape.circle,
             // border: new Border.all(

              //  color: Color(0xFF393D4D),
                height: 2.0,
                width: 2.0,
            //  ),
          //  ),
          color: Color(0xFF393D4D),
            child: new Column(

              children: <Widget>[
                new Text((index+1).toString(),style: new TextStyle(color: Color(0xFFFFFFFF), fontSize: 40.0)),
                new FlatButton(onPressed:()=> buttonclick((index+1).toString()),
                        child: new Text(randomAlpha(),
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),textAlign: TextAlign.center ))
              ],
            mainAxisSize: MainAxisSize.min
            ,crossAxisAlignment: CrossAxisAlignment.start,
            )

        );
      });
  return containers;
}

//function for input button
void buttonclick(String no)
{
  pass.add(no);
  controller.text= pass.join("");
}

String func(){
  String st;
  for(int i=0; i<=pass.length; i++)
  {st=st+pass[i].toString();}
  return st;
}

String randomAlpha()
{
  var rng = new Random();

     int temp = rng.nextInt(26);

  return finetic[temp];
}


List<FileDetails> loginDetail = [];
//List<FileDetails> passwordDetail = [];
//Set Url
String url ;
//class File Details
class FileDetails {
  final String user, passValue;

  FileDetails({ this.user, this.passValue});

  factory FileDetails.fromJson(Map<String, dynamic> json) {
    return new FileDetails(
      user: json['ID'],
      passValue: json['Password'],
    );
  }
}
