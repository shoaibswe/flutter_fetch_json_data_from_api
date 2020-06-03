import 'package:flutter/material.dart';

class pageOne extends StatefulWidget {
  var postsdata;

  pageOne(this.postsdata);

  @override
  _pageOneState createState() => _pageOneState(this.postsdata);
}

class _pageOneState extends State<pageOne> {
  var postsdata;

  _pageOneState(this.postsdata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("ID: ${postsdata['id']}"),
            Divider(),
            Text("Title: ${postsdata['title']}"),
            Divider(),
            Text("Body: ${postsdata['body']}"),
            Divider(),
            RaisedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
