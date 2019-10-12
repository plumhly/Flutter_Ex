import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapWiget extends StatelessWidget {
  const WrapWiget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 44
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 20,
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("A"),
              ),
              label: Text("hi plum")
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("A"),
              ),
              label: Text("hi plum")
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("A"),
              ),
              label: Text("hi plum")
            )
          ],
        ),
      ),
    );
  }
}