import 'package:flutter/material.dart';
import 'package:flutter_feth_from_api_app/pages/page1.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(title: "Shoaibs App", home: DashBoard()));
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List posts;

  Future<bool> _getPosts() async {
    String serviceURL = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(serviceURL);
    setState(() {
      posts = json.decode(response.body.toString());
    });
    return true;
  }

  void initState() {
    super.initState();
    this._getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data"),
      ),
      body:
          ListView.builder(
            itemCount: posts.length==null?0:posts.length,
            itemBuilder: (BuildContext context, int nth) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(posts[nth]["title"]),
                    onTap: (){
                      Route route1 = MaterialPageRoute(
                          builder: (context)=>pageOne(posts[nth]));
                      Navigator.push(context, route1);
                    },
                  )
                ],
              );
            },
        
      ),
    );
  }
}
