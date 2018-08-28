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
              'Login', textAlign: TextAlign.center, textScaleFactor: 1.0,),
        ),
        body:
       new Container(
          color: Color(0xFF262A38),
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[


            new Row(
              children: <Widget>[
                new SizedBox(width: 16.0,),
               new Container(
                 alignment: Alignment.center,
                 width: 350.0,
                 child:  new TextField(
                   controller: controller,

                   decoration: new InputDecoration(
                   hintText: 'Type Password through keyboard below', border: InputBorder.none ),
                   //maxLengthEnforced: true,
                   textAlign: TextAlign.center,
                   style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14.0, color: Colors.white),
                   //maxLength: 5,
                   //onChanged: passcheck(controller.text),
                   focusNode: new FocusNode(),
                   // cursorColor:  Colors.black,
                 ),
               ),

                new SizedBox(width: 45.0,),

                new Container(
                  height: 32.0,
                  width: 65.0,
                  color: Color(0xFF393D4D),
                  child: new FlatButton(onPressed: ()=> ClearListner(), child: new Text('Clear', style: TextStyle(
                      fontSize: 10.0,
                      color: Color(0xFFCFCFD1)),textAlign: TextAlign.center,)),
                ),
                new SizedBox(width: 4.0,),
                new Container(
                  height: 32.0,
                  width: 65.0,
                  color: Color(0xFF393D4D),
                  child: new FlatButton(onPressed: ()=> runApp(new MaterialApp(
                    home: Categories(),
                  )) //passcheck(controller.text)

                  ,
                      child: new Text('Login', style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFFCFCFD1)),textAlign: TextAlign.center,)),
                )

              ],
            ),

            /*
             new Flex(
               direction: Axis.vertical,
               children: <Widget>[

                 new TextField(
                   controller: controller,
                   decoration: new InputDecoration(

                   ),
                   //decoration: new InputDecoration(
                   //   hintText: 'Password', border: InputBorder.none ),
                   //maxLengthEnforced: true,
                   textAlign: TextAlign.center,
                   style: TextStyle(fontWeight: FontWeight.bold , fontSize: 10.0, color: Colors.white),

                   //maxLength: 5,
                   //onChanged: passcheck(controller.text),
                   focusNode: new FocusNode(),
                   // cursorColor:  Colors.black,
                 ),

                 new FlatButton(onPressed: ()=>controller.clear(), child: new Text('back'))

               ],
             ),


            *  new Container(
               height: 8.0,
               width: 8.0,
               child: new FlatButton(onPressed: ()=> passcheck(controller.text),
                   child: new Text('Go', style: TextStyle(
                       fontSize: 10.0,
                       color: Color(0xFFCFCFD1)),textAlign: TextAlign.center,)),
             ),
             */


            new Expanded(
                child: new GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  shrinkWrap: true,

                  childAspectRatio: 3.2,
                  padding: const EdgeInsets.only(
                      left: 4.0, top: 4.0, right: 4.0, bottom: 4.0),
                  children: _buildGridTiles(9), //Where is this function ?
                )

            )

           ],
         )

       )
      ,
        bottomNavigationBar: new BottomAppBar(
            color: Color(0xFF393D4D),
            child : new Row(
              children: <Widget>[
                SizedBox(width: 20.0,),
                new Image.asset( 'Images/imageedit_26_8716278705.png',fit: BoxFit.scaleDown,scale: 1.4,height: 45.0,width: 300.0,alignment: Alignment.centerLeft,)

              ],
              mainAxisSize: MainAxisSize.min,
            )

        )
    );
  }
/////////////////////////////////////////////////////////////////////////////////
 void passcheck(String text)  {

      for(int i=0; i<= loginDetail.length; i++){
        if(loginDetail[i].user==username && loginDetail[i].passValue==controller.text){
          runApp(new MaterialApp(
            home: Categories(),
          ));
        }
        else {ClearListner();}
      }
  }


  void ClearListner(){
    controller.clear();
    pass=[];
  }
////////////////////////////////////////////////////////////////////////////////
}
List<Widget> row = _buildGridTiles(9);

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
          width: 50.0,
           height: 50.0,
            //  ),
          //  ),
          color: Color(0xFF393D4D),
            child: new Flex(
              direction: Axis.vertical,
              children: <Widget>[
                new Text((index+1).toString(),style: new TextStyle(color: Color(0xFFFFFFFF), fontSize: 9.8)),
                new FlatButton(onPressed:()=> buttonclick((index+1).toString()),
                       // color: Colors.black,
                        child: new Text(randomAlpha(),

                        style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF),fontSize: 10.2),textAlign: TextAlign.center ,))
              ],
            //mainAxisSize: MainAxisSize.min
            //,crossAxisAlignment: CrossAxisAlignment.start,
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


List<String> randomAlphaStorage=[];
String randomAlpha()
{
  var rng = new Random();
  int temp = rng.nextInt(26);
if(randomAlphaStorage.contains(finetic[temp])){
  return randomAlpha();
}
else{
  randomAlphaStorage.add(finetic[temp]);
  return finetic[temp];
}
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
