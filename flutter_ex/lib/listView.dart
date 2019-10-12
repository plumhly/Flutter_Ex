import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  ListViewWidget({Key key}) : super(key: key);

  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  
  static const loading  = "##loading##";
  var words = <String>[loading];

  @override
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: words.length,
        itemBuilder: (context, index) {
          if (words[index] == loading) {
            if (words.length - 1 < 100) {
              _getData();
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text("没有更多了"),
              );
            }
          }
          return ListTile(
            title: Text(words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0,),
      ),
    );
  }

  void _getData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      words.insertAll(words.length - 1, generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        
      });
    });
  }
}