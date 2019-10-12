import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  GestureDetectorTestRoute({Key key}) : super(key: key);

  _GestureDetectorTestRouteState createState() => _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No getsture detect";
  @override
  Widget build(BuildContext context) {
    return Center(
       child: GestureDetector(
         child: Container(
           alignment: Alignment.center,
           color: Colors.blue,
           width: 200,
           height: 100,
           child: Text(_operation,
            style: TextStyle(color: Colors.white),  
           ),
         ),
         onTap: () => updateText("tap"),
         onDoubleTap: () => updateText("Double Test"),
         onLongPress: () => updateText("Long press"),
       ),
    );
  }

  void updateText(text) {
    setState(() {
      _operation = text;
    });
  }
}

class GestureRecognizeWidget extends StatefulWidget {
  GestureRecognizeWidget({Key key}) : super(key: key);

  _GestureRecognizeWidgetState createState() => _GestureRecognizeWidgetState();
}

class _GestureRecognizeWidgetState extends State<GestureRecognizeWidget> {

  TapGestureRecognizer tapG = TapGestureRecognizer();
  bool taggle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text.rich(
         TextSpan(
           children: [
             TextSpan(text: "你好世界"),
             TextSpan(
               text: "点我变色",
               style: TextStyle(
                 fontSize: 30,
                 color: taggle ? Colors.blue : Colors.red
               ),
               recognizer: tapG
               ..onTap = () {
                 setState(() {
                   taggle = !taggle;
                 });
               }
             ),
            TextSpan(text: "你好世界")
           ]
         )
       ),
    );
  }
}