import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'Main.dart';



class Search extends StatefulWidget {
  @override
  int i;
  Search(int i){
    this.i = i;
  }

  _SearchState createState() => new _SearchState(i);
}

class _SearchState extends State<Search> {
  TextEditingController controller = new TextEditingController();

  int i;

  _SearchState(int i){
    _fileDetails = [];
    _searchResult= [];
    this.i= i;
    if(i==1){url = "https://api.myjson.com/bins/1df73s";}
    else if(i==0){ url = "https://api.myjson.com/bins/8xpyw";}
    else if(i==2){ url = "https://api.myjson.com/bins/13w9fc";}
    else {url = "https://api.myjson.com/bins/mmovs";}
  }

// read json
  Future<Null> getFileDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _fileDetails.add(FileDetails.fromJson(user));
      }
    });
  }
  // Get json result and convert it to model. Then add
  @override
  void initState() {
    super.initState();

    getFileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('File ',textScaleFactor: 1.2, textAlign: TextAlign.center,),
        actions: <Widget>[
          new FlatButton(onPressed: () => runApp(new MaterialApp(
            home: new MainPage(),
          )
          ), child: new Text('Back',style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[900]) ))

        ],
        backgroundColor: Colors.blueGrey[900],
        //elevation: 0.0,
      ),
      backgroundColor: Colors.blueGrey[400],



      body: new Column(

        children: <Widget>[
          //search container



          new Container(
            decoration: new BoxDecoration(color: Colors.blueGrey[400]),
            //color: Theme.of(context).backgroundColor,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },),
                ),
              ),
            ),
          ),
          //container done for search column


          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, a) {
                return new Card(
                  child: new ListTile(

                    title: new Text(_searchResult[i].fileName ),//searched
                  ),
                  margin: const EdgeInsets.all(1.0),
                );

              },
            )
                : new ListView.builder(
              //itemExtent: 2.0,
              itemCount: _fileDetails.length,
              itemBuilder: (context, index) {
                return new Card(
                    child: new ListTile(

                      onTap: ()=>FlutterPdfViewer.loadAsset(pathGen(i, _fileDetails[index].fileName)),
                      //onTap: ()=> PdfViewerPlugin.getPdfViewer("load_json/a.pdf",10.0,400.0,400.0),

                      title: new Text(_fileDetails[index].fileName ), //not searched

                    ),
                    margin: const EdgeInsets.all(1.0),
                    //elevation: 1.0
                );
              },
              //addRepaintBoundaries: true,

            ),
          ),
          

        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _fileDetails.forEach((fileDetail) {
      if (fileDetail.fileName.toLowerCase().contains(text.toLowerCase()) || fileDetail.tagValue.toLowerCase().contains(text.toLowerCase()))
        //userDetail.firstName.contains(text) || userDetail.lastName.contains(text)
        _searchResult.add(fileDetail);
    });

    setState(() {});
  }

  String pathGen(int num , String name){
    if( num == 1 ){ print("asset/OISI Navy Library Engineering/"+name+".pdf");return ("asset/OISI Navy Library Engineering/"+name+".pdf"); }
    else if( num == 0 ){ return ("asset/OISI Navy Library Logistics/"+name+".pdf"); }
    else if( num == 2 ){ return ('asset/OISI Navy Library Medical/'+name+'.pdf'); }
    else { return ('asset/OISI Navy Library Warfare/'+name+'.pdf'); }
  }
}
List<FileDetails> _searchResult = [];
List<FileDetails> _fileDetails = [];

//Set Url
String url;

//class File Details
class FileDetails {
  final String fileName, tagValue;

  FileDetails({ this.fileName, this.tagValue});

  factory FileDetails.fromJson(Map<String, dynamic> json) {
    return new FileDetails(
      fileName: json['name'],
      tagValue: json['tag'],
    );
  }
}