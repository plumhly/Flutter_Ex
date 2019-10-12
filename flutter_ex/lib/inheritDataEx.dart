import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShareData extends InheritedWidget {
  ShareData({
    this.data,
    Widget child
  }): super(child: child);

  final int data;

  static ShareData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareData);
  }

  @override
  bool updateShouldNotify(ShareData oldWidget) {
    return oldWidget.data != data;
  }
}


class _TestWidget extends StatefulWidget {
  _TestWidget({Key key}) : super(key: key);

  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(ShareData.of(context).data.toString()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependency change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  InheritedWidgetTestRoute({Key key}) : super(key: key);

  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
       child: ShareData(
         data: count,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             _TestWidget(),
             FlatButton(
               child: Text("点击按钮"),
               onPressed: () => setState(() => ++count),
             )
           ],
         ),
       ),
    );
  }
}