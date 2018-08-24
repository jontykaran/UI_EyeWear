import 'package:flutter/material.dart';
import 'Search.dart';

class MainPage extends StatefulWidget {
  //Custom constructor, add property : title

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPageState();//Return a state object
  }
}
class MainPageState extends State<MainPage> {
  //State must have "build" => return Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.grey[900],
          title: new Text('Categories', textAlign: TextAlign.center, textScaleFactor: 1.2),
        ),
        body: new Container(
          decoration: new BoxDecoration(color: Colors.grey[800]),
          child:
          new GridView.extent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.only(left: 8.0,top: 8.0, right: 8.0, bottom: 8.0),
            children: _buildGridTiles(4),//Where is this function ?
          ),
        )


    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles) {
  List<String> folder = ['logistics','engineering','medical','warfare'];
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        //index = 0, 1, 2,...
        //final imageName = index < 9 ?
        //'images/image0${index + 1}.JPG' : 'images/image${index + 1}.JPG';
        return new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    width: 110.0,
                    height: 110.0,
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

              ],
            )

        );
      });
  return containers;
}
