import 'package:flutter/material.dart';
import 'Search.dart';

//-------------------------------------------------- CATEGORIES PAGE FOR FOLDERS --------------------------------------------------------

//class to display top level folders ---------------------------CATEGORIES----------------------------------------
class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoriesState();//Return a state object
  }
}

// class to keep track of state of above mentioned class ---------------STATE--------------------------------------
class CategoriesState extends State<Categories> {

  @override
  //Widget to build a UI- Design ////////////////////////////////////////////UI//////////////////////////////////
  Widget build(BuildContext context) {
    //scaffold
    return new Scaffold(
        //APPBar defined
        appBar: new AppBar(
          backgroundColor: Color(0xFF393D4D),
          title: new Text('Categories',textAlign: TextAlign.left, textScaleFactor: 1.2),
        ),
        //Body for the main screen
        body:
            new Container(
                decoration: new BoxDecoration(color: Color(0xFF262A38),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFF262A38), const Color(0xFF393D4D)],
                  tileMode: TileMode.clamp, // repeats the gradient over the canvas
                )
              ),
              child:
                  new GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0, right: 8.0, bottom: 8.0),
                      children: <Widget>[
  // Containers as children for each folder type (hard-coded)
  //--------------------------Logistics------------------------------------------------------------------------
          new Container(
              decoration: new BoxDecoration(
              gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFF7B4FBC), const Color(0xFFA57FDC)],
            ),
          ),

          child: new Column(
                    children: <Widget>[
                              new Row(
                                  children: <Widget>[new SizedBox(width: 10.0,)
                                                    ,new Image.asset('Images/logistics.png',
                                                                   fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                              ),
                              new SizedBox(height: 40.0,),
                              new FlatButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Search(0))),
                                              child:  new Text('Logistics' , textAlign: TextAlign.left,
                                                                style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,),
                              )
                    ],
          )
        ),
// -----------------------------------ENGINEERING---------------------------------------------------------
          new Container(
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [const Color(0xFF21C3FA), const Color(0xFF6CC688)], // whitish to gray
                          ),
                ),
                child: new Column(
                            children: <Widget>[
                                      new Row(
                                              children: <Widget>[
                                                new SizedBox(width: 10.0,),
                                                new Image.asset('Images/engineering.png',
                                                                 fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                                      ),
                                      new SizedBox(height: 40.0,),
                                      new FlatButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Search(1))),
                                                      child:  new Text('Engineering' , textAlign: TextAlign.left,
                                                                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,),
                                      )
                            ],
                )
              ),
//--------------------------------------------------MEDICAL
          new Container(
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [const Color(0xFF19B78E), const Color(0xFF2CDFB4)], // whitish to gray
                          ),
                ),

                child: new Column(
                            children: <Widget>[
                                              new Row(
                                                      children: <Widget>[new SizedBox(width: 10.0,),
                                                      new Image.asset('Images/medical.png',
                                                                        fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                                              ),
                                              new SizedBox(height: 40.0,),
                                              new FlatButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Search(2))),
                                                              child:  new Text('Medical' , textAlign: TextAlign.left,
                                                                                style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,),
                                                            )
                            ],
                )
              ),
//-------------------------------------------WARFARE----------------------------------------------------------------------------
          new Container(
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                  colors: [const Color(0xFFFF8442), const Color(0xFFFF9F52)],
                  ),
                ),
                child: new Column(
                                  children: <Widget>[
                                                    new Row(
                                                            children: <Widget>[new SizedBox(width: 10.0,),
                                                            new Image.asset('Images/warfare.png',
                                                                            fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                                                     ),
                                                    new SizedBox(height: 40.0,),
                                                    new FlatButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Search(3))),
                                                                    child:  new Text('Warfare' , textAlign: TextAlign.left,
                                                                                      style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,),
                                                    )
                                  ],
                )
              )
            ]
          ),
        ),

        //Navigation Bar at the bottom with logo and Logout
        bottomNavigationBar: new BottomAppBar(
                                            color: Color(0xFF393D4D),
                                            child : new Row(
                                                            children: <Widget>[
                                                                              SizedBox(width: 20.0,),
                                                                              new Image.asset( 'Images/imageedit_26_8716278705.png',fit: BoxFit.scaleDown,
                                                                                                  scale: 1.5,height: 60.0,width: 300.0,alignment: Alignment.centerLeft,),
                                                                              SizedBox(width: 150.0,),
                                                                              new FlatButton(onPressed: ()=> emp(), child: new Text('Logout', style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1))
                                                            ],
                                            )
                              )
        );
    }

    // fuction to use in logout button
    // pops two screen so takes back to login page
    void emp()
    {Navigator.pop(context);
      Navigator.pop(context);
    }

  }