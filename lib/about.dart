import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//---------------------------------------------------- Class for about page --------------------------------------------------------
class About extends StatelessWidget {

  //Widget ------------------------------------------
  @override
  Widget build(BuildContext context) {
    //landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    //function to go back
    void popFun(){
      Navigator.pop(context);
      Navigator.pop(context);
    }
    // material container
    return new Scaffold(
      appBar: new AppBar( title: new Text('About', style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF393D4D)) ),
                        actions: <Widget>[
                          new FlatButton(onPressed: ()=>popFun(), child: new Text('back', style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF393D4D)) ))
                        ],
                        backgroundColor: Color(0xFF393D4D),),

      body:
      new Material(
          child: new Container(
            //scrollable list
              child: new SingleChildScrollView(
                  child: new ConstrainedBox(
                    constraints: new BoxConstraints(),
                    child: new Column(children: <Widget>[
                      new Image.network(
                        'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                      new Container(
                        padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        color: Colors.grey,
                        child: new Text(
                          'Pision',
                          textDirection: TextDirection.ltr,
                          style: new TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new Container(
                        child: new Column(
                          children: <Widget>[

                            new Text(
                              'About',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                            ),
                            new Container(
                              height:16.0,
                            ),
                            new Text(
                              'Application Name: FileWear',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'Version: 0.01',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'Created by: Psion Consulting Ltd (company No. 30342)',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Container(
                              height:16.0,
                            ),
                            new Text(
                              'About: FileWear is an android based file explore application that has been designed to work with voice controlled smart enabled eyewear. It allows the user to search and view pdf media files stored on the eyewear device using voice control and head movement only. The addition of a QR code reader also provides the option to rapidly access information down to specific a page.  This enables the user to be able to access a full library of information, such as engineering drawings, repair and operating information while offline and hands free. Users can navigate through documents using voice commands and head movements to go to a specific page, Zoom-in/out , freeze frame or page up/page down. The application has built-in security features such as secure login, encryption of information  and user privilege settings. The latter feature allows the system administrator to be able to restrict library access to specific documents.',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Container(
                              height: 16.0,
                            ),
                            new Text(
                              'Support',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                            ),
                            new Container(
                              height:16.0,
                            ),
                            new Text(
                              'Email: info@psionconsulting.co.uk',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'Telephone: 023 9387 7592',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],

                        ),
                      )
                    ]),
                  ))))
      ,
    );
  }
}