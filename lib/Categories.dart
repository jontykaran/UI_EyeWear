import 'package:flutter/material.dart';
import 'Search.dart';

class Categories extends StatefulWidget {
  //Custom constructor, add property : title

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CategoriesState();//Return a state object
  }
}
class CategoriesState extends State<Categories> {
  //State must have "build" => return Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

        appBar: new AppBar(
          backgroundColor: Color(0xFF393D4D),
          title: new Text('Categories',textAlign: TextAlign.left, textScaleFactor: 1.2),
        ),

        body: new Container(
          decoration: new BoxDecoration(color: Color(0xFF262A38),

            gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [const Color(0xFF262A38), const Color(0xFF393D4D)], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas


          )),
          child:
          new GridView.count(
            //maxCrossAxisExtent: 200.0,
            crossAxisCount: 4,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            padding: const EdgeInsets.only(left: 8.0,top: 8.0, right: 8.0, bottom: 8.0),
            children: <Widget>[

// Logistics/////////////////////////////////////////////////
          new Container(

          decoration: new BoxDecoration(
          gradient: new LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [const Color(0xFF7B4FBC), const Color(0xFFA57FDC)], // whitish to gray
            //tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),

        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[new SizedBox(width: 10.0,)
              ,new Image.asset('Images/logistics.png',
                  fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
            )
            ,
            new SizedBox(height: 40.0,)
            ,
            new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(0))),
              child:  new Text('Logistics' , textAlign: TextAlign.left,
                style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,)
              ,// color: Colors.grey[800],
            )

          ],
        )

    ),

//engineering///////////////////////////////////////////////////////////////////////////////////////////////////////

          new Container(

              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFF21C3FA), const Color(0xFF6CC688)], // whitish to gray
                  //tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),

              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[new SizedBox(width: 10.0,)
                    ,new Image.asset('Images/engineering.png',
                        fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                  )
                  ,
                  new SizedBox(height: 40.0,)
                  ,
                  new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(1))),
                    child:  new Text('Engineering' , textAlign: TextAlign.left,
                      style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,)
                    ,// color: Colors.grey[800],
                  )

                ],
              )

          ),

////////medical///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          new Container(

              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFF19B78E), const Color(0xFF2CDFB4)], // whitish to gray
                  //tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),

              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[new SizedBox(width: 10.0,)
                    ,new Image.asset('Images/medical.png',
                        fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                  )
                  ,
                  new SizedBox(height: 40.0,)
                  ,
                  new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(2))),
                    child:  new Text('Medical' , textAlign: TextAlign.left,
                      style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,)
                    ,// color: Colors.grey[800],
                  )

                ],
              )

          ),

///////// warfare //////////////////////////////////////////////////////////////////////////////////////////////

          new Container(

              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFFFF8442), const Color(0xFFFF9F52)], // whitish to gray
                  //tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),

              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[new SizedBox(width: 10.0,)
                    ,new Image.asset('Images/warfare.png',
                        fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                  )
                  ,
                  new SizedBox(height: 40.0,)
                  ,
                  new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(3))),
                    child:  new Text('Warfare' , textAlign: TextAlign.left,
                      style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,)
                    ,// color: Colors.grey[800],
                  )

                ],
              )

          )



            ]

            //_buildGridTiles(4),//Where is this function ?
          ),
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
}



















/*
*
* List<Widget> _buildGridTiles(numberOfTiles) {
  List<String> folder = ['logistics','engineering','medical','warfare'];
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        return new Container(

            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                colors: [const Color(0xFF999999), const Color(0xFFFFFFEE)], // whitish to gray
                //tileMode: TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),

            child: new Column(
              children: <Widget>[
                     new Row(
                       children: <Widget>[new SizedBox(width: 10.0,)
                       ,new Image.asset('Images/'+folder[index]+'.png',
                           fit: BoxFit.scaleDown,scale: 5.0,height: 50.0,width: 50.0,alignment: Alignment.bottomLeft)],
                     )
                 ,
                     new SizedBox(height: 40.0,)
                 ,
                     new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(index))),
                       child:  new Text(folder[index] , textAlign: TextAlign.left,
                                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.1,)
                       ,// color: Colors.grey[800],

                       )

              ],
            )

        );
      });
  return containers;
}




/*
new Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new ExactAssetImage(
                              'Images/'+folder[index]+'.png',

                            )
                        )
                    )),
                new FlatButton(onPressed: ()=> runApp(new MaterialApp(home: Search(index))), child:  new Text(folder[index] , textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white70), textScaleFactor: 1.5,)
                  , color: Colors.grey[800],
                  textColor: Colors.deepOrange,)
* */
*
*
* */