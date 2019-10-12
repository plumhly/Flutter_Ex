import 'package:flutter/material.dart';

class EventExWidget extends StatefulWidget {
  EventExWidget({Key key}) : super(key: key);

  _EventExWidgetState createState() => _EventExWidgetState();
}

class _EventExWidgetState extends State<EventExWidget> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //    child: Center(
        //  child: Listener(
          //  child: Container(
          //    alignment: Alignment.center,
          //    color: Colors.blue,
          //    width: 300,
          //    height: 150,
          //    child: Text(_event?.toString() ?? "", style: TextStyle(color: Colors.white, fontSize: 12)),
          //  ),
          //  onPointerDown: (event) => setState( () => _event = event),
          //  onPointerUp: (event) => setState( () => _event = event),
          //  onPointerMove: (event) => setState( () => _event = event),
          // child: ConstrainedBox(
          //   constraints: BoxConstraints.tight(Size(300, 150)),
          //   child: Center(
          //     child: Text("Box a"),
          //   ),
          // ),
          // onPointerDown: (event) => print("down A"),
          // behavior: HitTestBehavior.opaque,
        //  ),
        // child: Stack(
        //   children: <Widget>[
        //     Listener(
        //       child: ConstrainedBox(
        //         constraints: BoxConstraints.tight(Size(300, 200)),
        //         child: DecoratedBox(
        //           decoration: BoxDecoration(
        //             color: Colors.blue
        //           ),
        //         ),
        //       ),
        //       onPointerDown: (event) => print("down0"),
        //     ),
        //     Listener(
        //       child: ConstrainedBox(
        //         constraints: BoxConstraints.tight(Size(200, 100)),
        //         child: DecoratedBox(
        //           decoration: BoxDecoration(
        //             color: Colors.red
        //           ),
        //           child: Center(child: Text("左上角200*100范围内非文本区域点击"),),
        //         ),
        //       ),
        //       onPointerDown: (event) => print("down1"),
        //       behavior: HitTestBehavior.translucent,
        //     )
        //   ],
        // ),
    //    ),
    // );
    // return Stack(
    //   children: <Widget>[
    //     Listener(
    //       child: ConstrainedBox(
    //         constraints: BoxConstraints.tight(Size(300.0, 200.0)),
    //         child: DecoratedBox(
    //             decoration: BoxDecoration(color: Colors.blue)),
    //       ),
    //       onPointerDown: (event) => print("down0"),
    //     ),
    //     Listener(
    //       child: ConstrainedBox(
    //         constraints: BoxConstraints.tight(Size(200.0, 100.0)),
    //         child: Center(child: Text("左上角200*100范围内非文本区域点击", style: TextStyle(fontSize: 12),)),
    //       ),
    //       onPointerDown: (event) => print("down1"),
    //       //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
    //     )
    //   ],
    // );
    return Container(
      child: Center(
        child: Listener(
          child: IgnorePointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 100,
              ),
              onPointerDown: (event) => print("in"),
            ),
          ),
          onPointerDown: (event) => print("up"),
        ),
      ),
    );
  }
}