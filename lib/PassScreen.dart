import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';


List<String> finetic = ['alpha','bravo','charlie','delta','echo','foxtrot','golf','hotel',
                        'india','julliet','kilo','lima','mike','november','oscar','papa',
                        'quebec','romeo','sierra','tango','uniform','victor','whiskey','xray','yankee','zulu'];

List<int> pass=[];
TextEditingController controller = new TextEditingController();

class Pass extends StatefulWidget {
  //Custom constructor, add property : title

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PassState();//Return a state object
  }
}

class PassState extends State<Pass> {

  PassState() {
    url = "https://api.myjson.com/bins/169v7s";
    loginDetail = [];
    passwordDetail = [];
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
               //decoration: new InputDecoration(
                //   hintText: 'Password', border: InputBorder.none ),
               //maxLengthEnforced: true,
               textAlign: TextAlign.center,
               style: TextStyle(fontWeight: FontWeight.bold ),

               //maxLength: 5,
               //onChanged: onSearchTextChanged,
               focusNode: new FocusNode(),
               cursorColor:  Colors.black,
             ),

             SizedBox(height: 60.0),

            new Expanded(child:  new GridView.count(
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

           child : new Image.asset( 'Images/imageedit_26_8716278705.png',fit: BoxFit.scaleDown,scale: 2.0,height: 50.0,width: 30.0,alignment: Alignment.centerLeft,)
        )
    );
  }

  onSearchTextChanged(String text) async {
    //passwordDetail.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
  }

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
              //  width: 5.0,
            //  ),
          //  ),
          color: Color(0xFF393D4D),
            child: new Column(
              children: <Widget>[
                new Text((index+1).toString(),style: new TextStyle(color: Color(0xFFFFFFFF), fontSize: 40.0)),
                new FlatButton(onPressed:()=> buttonclick(index),
                        child: new Text(randomAlpha(),
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),textAlign: TextAlign.center ))
              ],
            )

        );
      });
  return containers;
}


void buttonclick(int no)
{
  pass.add(no+1);
  controller.text= pass.toString();
}

String randomAlpha()
{
  var rng = new Random();

     int temp = rng.nextInt(26);

  return finetic[temp];
}


List<FileDetails> loginDetail = [];
  List<FileDetails> passwordDetail = [];
//Set Url
String url ;
//class File Details
class FileDetails {
  final String fileName, tagValue;

  FileDetails({ this.fileName, this.tagValue});

  factory FileDetails.fromJson(Map<String, dynamic> json) {
    return new FileDetails(
      fileName: json['ID'],
      tagValue: json['Password'],
    );
  }
}
