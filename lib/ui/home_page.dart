import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static String _search;
  static int _offset = 0;
  String _networkImageLogo = "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif";
  String _SearchBestGifs = "https://api.giphy.com/v1/gifs/trending?api_key=uDI3Lf7m7gJy9Ez0Ykfw6yLBMo2babne&limit=20&rating=G";
  String _SearchUserGifs = "https://api.giphy.com/v1/gifs/search?api_key=uDI3Lf7m7gJy9Ez0Ykfw6yLBMo2babne&q=$_search&limit=20&$_offset=75&rating=G&lang=en";

    
  Future<Map> _getGifs() async {
  
    http.Response response;
    
    if (_search == null) {
      response = await http.get(_SearchBestGifs);
    } else {
      response = await http.get(_SearchUserGifs);
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(_networkImageLogo),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquisar...",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}