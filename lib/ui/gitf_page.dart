import 'package:share/share.dart';
import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {

  final Map _gifsData;

  GifPage(this._gifsData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_gifsData["title"]),
        actions: <Widget>[
         IconButton(
           icon: Icon(Icons.share),
           onPressed: () {
             Share.share(_gifsData["images"]["fixed_height"]["url"]);
           },
         ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifsData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
